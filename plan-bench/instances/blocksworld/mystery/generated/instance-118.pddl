(define (problem BW-generalization-4)
(:domain mystery-4ops)(:objects l c b f j d a h)
(:init 
(harmony)
(planet l)
(planet c)
(planet b)
(planet f)
(planet j)
(planet d)
(planet a)
(planet h)
(province l)
(province c)
(province b)
(province f)
(province j)
(province d)
(province a)
(province h)
)
(:goal
(and
(craves l c)
(craves c b)
(craves b f)
(craves f j)
(craves j d)
(craves d a)
(craves a h)
)))