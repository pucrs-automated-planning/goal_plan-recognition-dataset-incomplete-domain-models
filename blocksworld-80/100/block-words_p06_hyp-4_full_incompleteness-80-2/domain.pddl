(define (domain blocks)
  (:requirements :strips :typing :equality)
  (:types block)
  (:predicates (on ?x ?y - block)
	       (ontable ?x - block)
	       (clear ?x - block)
	       (handempty)
	       (holding ?x - block)
	       )

  (:action pick-up
	     :parameters (?x - block)
	     
:precondition
	(and
		(ontable ?x)
	)
:poss-precondition
	(and
		(clear ?x)
		(handempty)
		(ontable ?x)
	)
:effect
	(and
	)
:poss-effect
	(and
		(holding ?x)
		(not (clear ?x))
		(not (handempty))
		(not (ontable ?x))
	)
)

(:action put-down
	     :parameters (?x - block)
	     
:precondition
	(and
		
	)
:poss-precondition
	(and
		(holding ?x)
	)
:effect
	(and
		(handempty)
		(not (holding ?x))
	)
:poss-effect
	(and
		(ontable ?x)
		(clear ?x)
	)
)

(:action stack
	     :parameters (?x ?y - block)
	     
:precondition
	(and
		(clear ?y)
		(holding ?x)
	)
:poss-precondition
	(and
	)
:effect
	(and
	)
:poss-effect
	(and
		(clear ?x)
		(handempty)
		(on ?x ?y)
		(not (clear ?y))
		(not (holding ?x))
	)
)

(:action unstack
	     :parameters (?x ?y - block)
	     
:precondition
	(and
		(on ?x ?y)
	)
:poss-precondition
	(and
		(clear ?x)
		(on ?y ?x)
		(clear ?y)
		(handempty)
	)
:effect
	(and
		(holding ?x)
	)
:poss-effect
	(and
		(clear ?y)
		(not (clear ?x))
		(not (on ?x ?y))
		(not (handempty))
	)
)

)