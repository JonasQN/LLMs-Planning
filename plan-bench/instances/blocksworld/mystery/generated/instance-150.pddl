(define (problem BW-generalization-4)
(:domain mystery-4ops)(:objects a d g j i c l b f e)
(:init 
(harmony)
(planet a)
(planet d)
(planet g)
(planet j)
(planet i)
(planet c)
(planet l)
(planet b)
(planet f)
(planet e)
(province a)
(province d)
(province g)
(province j)
(province i)
(province c)
(province l)
(province b)
(province f)
(province e)
)
(:goal
(and
(craves a d)
(craves d g)
(craves g j)
(craves j i)
(craves i c)
(craves c l)
(craves l b)
(craves b f)
(craves f e)
)))