(define (domain grid)
(:requirements :strips :typing)
(:types place shape key)
(:predicates 
  (conn ?x ?y - place)
  (key-shape ?k - key ?s - shape)
  (lock-shape ?x - place ?s - shape)
  (at-key ?r - key ?x - place )
  (at-robot ?x - place)
  (locked ?x - place)
  (carrying ?k - key)
  (open ?x - place)
)

(:action unlock
  :parameters (?curpos ?lockpos - place ?key - key ?shape - shape)
  
:precondition
	(and
		(lock-shape ?lockpos ?shape)
		(conn ?curpos ?lockpos)
		(carrying ?key)
		(locked ?lockpos)
		(key-shape ?key ?shape)
		(at-robot ?curpos)
	)
:poss-precondition
	(and
	)
:effect
	(and
		(not (locked ?lockpos))
	)
:poss-effect
	(and
		(open ?lockpos)
	)
)

(:action move
  :parameters (?curpos ?nextpos - place)
  
:precondition
	(and
		(conn ?curpos ?nextpos)
		(at-robot ?curpos)
	)
:poss-precondition
	(and
		(open ?nextpos)
	)
:effect
	(and
		(at-robot ?nextpos)
		(not (at-robot ?curpos))
	)
:poss-effect
	(and
	)
)

(:action pickup
  :parameters (?curpos - place ?key - key)
  
:precondition
	(and
		(at-key ?key ?curpos)
	)
:poss-precondition
	(and
		(at-robot ?curpos)
	)
:effect
	(and
		(carrying ?key)
		(not (at-key ?key ?curpos))
	)
:poss-effect
	(and
		(not (at-robot ?curpos))
	)
)

)