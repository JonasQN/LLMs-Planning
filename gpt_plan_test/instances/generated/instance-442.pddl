(define (problem BW-generalization-4)
(:domain blocksworld-4ops)(:objects e f d l j)
(:init 
(handempty)
(ontable e)
(ontable f)
(ontable d)
(ontable l)
(ontable j)
(clear e)
(clear f)
(clear d)
(clear l)
(clear j)
)
(:goal
(and
(on e f)
(on f d)
(on d l)
(on l j)
)))