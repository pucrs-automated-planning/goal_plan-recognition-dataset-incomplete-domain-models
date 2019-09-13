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
	)
:poss-precondition
	(and
		(at-robot ?curpos)
		(locked ?lockpos)
		(key-shape ?key ?shape)
		(conn ?curpos ?lockpos)
		(carrying ?key)
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
		(at-robot ?curpos)
		(open ?nextpos)
	)
:poss-precondition
	(and
		(conn ?curpos ?nextpos)
	)
:effect
	(and
	)
:poss-effect
	(and
		(at-robot ?nextpos)
		(not (at-robot ?curpos))
	)
)

(:action pickup
  :parameters (?curpos - place ?key - key)
  
:precondition
	(and
		(at-robot ?curpos)
	)
:poss-precondition
	(and
		(at-key ?key ?curpos)
		(at-key ?key ?curpos)
	)
:effect
	(and
		(carrying ?key)
	)
:poss-effect
	(and
		(not (at-key ?key ?curpos))
	)
)

)