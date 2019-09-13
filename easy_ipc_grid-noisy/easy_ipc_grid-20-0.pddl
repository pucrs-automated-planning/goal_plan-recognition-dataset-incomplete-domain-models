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
		(carrying ?key)
		(conn ?curpos ?lockpos)
		(key-shape ?key ?shape)
		(at-robot ?curpos)
		(lock-shape ?lockpos ?shape)
	)
:poss-precondition
	(and
		(locked ?lockpos)
		(locked ?lockpos)
	)
:effect
	(and
	)
:poss-effect
	(and
		(open ?lockpos)
		(not (locked ?lockpos))
	)
)

(:action move
  :parameters (?curpos ?nextpos - place)
  
:precondition
	(and
		(conn ?curpos ?nextpos)
		(at-robot ?curpos)
		(open ?nextpos)
	)
:poss-precondition
	(and
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
		(at-robot ?curpos)
	)
:poss-precondition
	(and
	)
:effect
	(and
		(carrying ?key)
		(not (at-key ?key ?curpos))
	)
:poss-effect
	(and
	)
)

)