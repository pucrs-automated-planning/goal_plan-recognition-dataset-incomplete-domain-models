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
	)
:poss-precondition
	(and
		(at-robot ?curpos)
		(carrying ?key)
		(key-shape ?key ?shape)
		(locked ?lockpos)
		(locked ?lockpos)
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
		(conn ?curpos ?nextpos)
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
		(not (open ?nextpos))
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
	)
:poss-effect
	(and
		(not (at-key ?key ?curpos))
	)
)

)