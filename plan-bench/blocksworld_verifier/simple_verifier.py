class BlocksWorldVerifier:
    encoded_objects = {
        "a": "red block", "b": "blue block", "c": "orange block", "d": "yellow block",
        "e": "white block", "f": "magenta block", "g": "black block", "h": "cyan block",
        "i": "green block", "j": "violet block", "k": "silver block", "l": "gold block"
    }

    # Reverse the encoded_objects to easily map names to their encoded letters
    name_to_encoded = {v: k for k, v in encoded_objects.items()}

    def __init__(self, initial_state):
        self.state = self.parse_initial_state(initial_state)
        self.holding = None  # Robot arm initially holds nothing

    def parse_initial_state(self, initial_state):
        state = {
            'on': {},
            'ontable': set(),
            'clear': set(),
            'handempty': False
        }
        for predicate in initial_state:
            parts = predicate.split('_')
            if parts[0] == 'on':
                state['on'][parts[1]] = parts[2]
            elif parts[0] == 'ontable':
                state['ontable'].add(parts[1])
            elif parts[0] == 'clear':
                state['clear'].add(parts[1])
            elif parts[0] == 'handempty':
                state['handempty'] = True
        return state

    def parse_action(self, action):
        parts = action.strip('()').split()
        action_name = parts[0]
        args = parts[1:]
        return action_name, args

    def convert_to_colors(self, *args):
        return [self.encoded_objects[arg] for arg in args]

    def is_valid_unstack(self, block, from_block):
        if self.state['on'].get(block) == from_block and block in self.state['clear']:
            return True, "Valid unstack"
        return False, f"Invalid unstack: {self.convert_to_colors(block)[0]} is not on top of {self.convert_to_colors(from_block)[0]} or is not clear"

    def is_valid_put_down(self):
        if self.holding:
            return True, "Valid put-down"
        return False, "Invalid put-down: No block is being held"

    def is_valid_pick_up(self, block):
        if block in self.state['ontable'] and block in self.state['clear']:
            return True, "Valid pick-up"
        return False, f"Invalid pick-up: {self.convert_to_colors(block)[0]} is not on the table or is not clear"

    def is_valid_stack(self, block, to_block):
        if self.holding == block and to_block in self.state['clear']:
            return True, "Valid stack"
        return False, f"Invalid stack: {self.convert_to_colors(block)[0]} is not being held or {self.convert_to_colors(to_block)[0]} is not clear"

    def apply_action(self, action, args):
        if action == "unstack":
            block, from_block = args
            del self.state['on'][block]
            self.state['clear'].add(from_block)
            self.holding = block
            self.state['handempty'] = False
        elif action == "put-down":
            block = args[0]
            self.state['ontable'].add(block)
            self.state['clear'].add(block)
            self.holding = None
            self.state['handempty'] = True
        elif action == "pick-up":
            block = args[0]
            self.state['ontable'].remove(block)
            self.state['clear'].remove(block)
            self.holding = block
            self.state['handempty'] = False
        elif action == "stack":
            block, to_block = args
            self.state['on'][block] = to_block
            self.state['clear'].remove(to_block)
            self.state['clear'].add(block)
            self.holding = None
            self.state['handempty'] = True

    def verify_plan(self, plan):
        steps = plan.split('\n')
        for step in steps:
            if not step.strip():
                continue  # Skip empty lines
            action, args = self.parse_action(step)
            action_colored = f"({action} " + ' '.join(self.convert_to_colors(*args)) + ")"
            if action == "unstack":
                valid, message = self.is_valid_unstack(*args)
            elif action == "put-down":
                valid, message = self.is_valid_put_down()
            elif action == "pick-up":
                valid, message = self.is_valid_pick_up(*args)
            elif action == "stack":
                valid, message = self.is_valid_stack(*args)
            else:
                return False, f"Unknown action: {action}"

            if not valid:
                return False, f"Invalid step: {action_colored}. Reason: {message}"
            self.apply_action(action, args)
        return True, "All steps are valid"