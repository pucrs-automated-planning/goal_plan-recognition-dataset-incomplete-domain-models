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
		(key-shape ?key ?shape)
	)
:poss-precondition
	(and
		(lock-shape ?lockpos ?shape)
		(locked ?lockpos)
		(carrying ?key)
	)
:effect
	(and
		(not (locked ?lockpos))
	)
:poss-effect
	(and
		(open ?lockpos)
		(not (lock-shape ?lockpos ?shape))
	)
)

(:action move
  :parameters (?curpos ?nextpos - place)
  
:precondition
	(and
		(open ?nextpos)
	)
:poss-precondition
	(and
		(conn ?curpos ?nextpos)
		(at-robot ?curpos)
	)
:effect
	(and
		(at-robot ?nextpos)
	)
:poss-effect
	(and
		(not (at-robot ?curpos))
	)
)

(:action pickup
  :parameters (?curpos - place ?key - key)
  
:precondition
	(and
	)
:poss-precondition
	(and
		(at-robot ?curpos)
		(at-key ?key ?curpos)
	)
:effect
	(and
		(not (at-key ?key ?curpos))
	)
:poss-effect
	(and
		(carrying ?key)
	)
)

)