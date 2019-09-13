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
		(at-robot ?curpos)
		(conn ?curpos ?lockpos)
		(locked ?lockpos)
		(key-shape ?key ?shape)
	)
:poss-precondition
	(and
		(lock-shape ?lockpos ?shape)
		(carrying ?key)
	)
:effect
	(and
		(open ?lockpos)
		(not (locked ?lockpos))
	)
:poss-effect
	(and
		(not (at-robot ?curpos))
	)
)

(:action move
  :parameters (?curpos ?nextpos - place)
  
:precondition
	(and
		(at-robot ?curpos)
		(conn ?curpos ?nextpos)
	)
:poss-precondition
	(and
		(open ?nextpos)
	)
:effect
	(and
		(not (at-robot ?curpos))
	)
:poss-effect
	(and
		(at-robot ?nextpos)
	)
)

(:action pickup
  :parameters (?curpos - place ?key - key)
  
:precondition
	(and
		(at-robot ?curpos)
		(at-key ?key ?curpos)
	)
:poss-precondition
	(and
		(at-key ?key ?curpos)
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