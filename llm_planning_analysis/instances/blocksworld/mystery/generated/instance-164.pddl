(define (problem BW-generalization-4)
(:domain mystery-4ops)(:objects g h k e f d i b c l j a)
(:init 
(harmony)
(planet g)
(planet h)
(planet k)
(planet e)
(planet f)
(planet d)
(planet i)
(planet b)
(planet c)
(planet l)
(planet j)
(planet a)
(province g)
(province h)
(province k)
(province e)
(province f)
(province d)
(province i)
(province b)
(province c)
(province l)
(province j)
(province a)
)
(:goal
(and
(craves g h)
(craves h k)
(craves k e)
(craves e f)
(craves f d)
(craves d i)
(craves i b)
(craves b c)
(craves c l)
(craves l j)
(craves j a)
)))