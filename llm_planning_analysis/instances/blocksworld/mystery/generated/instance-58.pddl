(define (problem BW-generalization-4)
(:domain mystery-4ops)(:objects f k c h a e d i g b)
(:init 
(harmony)
(planet f)
(planet k)
(planet c)
(planet h)
(planet a)
(planet e)
(planet d)
(planet i)
(planet g)
(planet b)
(province f)
(province k)
(province c)
(province h)
(province a)
(province e)
(province d)
(province i)
(province g)
(province b)
)
(:goal
(and
(craves f k)
(craves k c)
(craves c h)
(craves h a)
(craves a e)
(craves e d)
(craves d i)
(craves i g)
(craves g b)
)))