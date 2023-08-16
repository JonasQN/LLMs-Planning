(define (problem LG-generalization)
(:domain logistics-strips)(:objects c0 t0 a0 l0-2 p1 l0-3 p2 l0-1 p0 l0-0 l0-4 c1 t1 a1 l1-2 p4 l1-3 p5 l1-1 p3 l1-0 l1-4)
(:init 
(CITY c0)
(TRUCK t0)
(AIRPLANE a0)
(LOCATION l0-2)
(in-city l0-2 c0)
(OBJ p1)
(at p1 l0-2)
(at t0 l0-2)
(LOCATION l0-3)
(in-city l0-3 c0)
(OBJ p2)
(at p2 l0-3)
(LOCATION l0-1)
(in-city l0-1 c0)
(OBJ p0)
(at p0 l0-1)
(LOCATION l0-0)
(in-city l0-0 c0)
(LOCATION l0-4)
(in-city l0-4 c0)
(CITY c1)
(TRUCK t1)
(AIRPLANE a1)
(LOCATION l1-2)
(in-city l1-2 c1)
(OBJ p4)
(at p4 l1-2)
(at t1 l1-2)
(LOCATION l1-3)
(in-city l1-3 c1)
(OBJ p5)
(at p5 l1-3)
(LOCATION l1-1)
(in-city l1-1 c1)
(OBJ p3)
(at p3 l1-1)
(LOCATION l1-0)
(in-city l1-0 c1)
(LOCATION l1-4)
(in-city l1-4 c1)
(AIRPORT l0-4)
(at a0 l0-4)
(AIRPORT l1-4)
(at a1 l1-4)
)
(:goal
(and
(at p1 l0-3)
(at p2 l0-1)
(at p4 l1-3)
(at p5 l1-1)
(at p0 l1-4)
(at p3 l0-4)
)))