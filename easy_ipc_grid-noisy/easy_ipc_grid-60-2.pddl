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
		(locked ?lockpos)
		(carrying ?key)
		(key-shape ?key ?shape)
	)
:poss-precondition
	(and
		(conn ?curpos ?lockpos)
		(at-robot ?curpos)
		(lock-shape ?lockpos ?shape)
		(locked ?lockpos)
	)
:effect
	(and
		(open ?lockpos)
		(not (locked ?lockpos))
	)
:poss-effect
	(and
		(not (lock-shape ?lockpos ?shape))
	)
)

(:action move
  :parameters (?curpos ?nextpos - place)
  
:precondition
	(and
		(conn ?curpos ?nextpos)
		(open ?nextpos)
		(at-robot ?curpos)
	)
:poss-precondition
	(and
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
		(at-key ?key ?curpos)
		(at-robot ?curpos)
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