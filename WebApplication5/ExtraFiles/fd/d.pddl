(define (domain DesignEnvP)   
  (:requirements :typing :action-costs)  

 (:types node)
	(:functions
	  (total-cost)
	 )
(:predicates
       (connectHard ?src - node ?target - node)
	   (connectEasy ?src - node ?target - node)
       (connectMeduim ?src - node ?target - node)
	   (at ?src - node)
	   (visited ?target - node)
)

(:constants
    node1 node2 node3 node4 node5 node6 node7 node8 node9 node10 node11 node12 - node
)

(:action moveMeduim
    :parameters  (?src - node ?target - node)
    :precondition(and   (connectMeduim ?src ?target)(at ?src))
    :effect (and  (at ?target) (not (at ?src))(visited ?target) (increase (total-cost) 5))

	)
	
(:action moveHard
    :parameters( ?src - node ?target - node)
    :precondition(and  (connectHard ?src ?target )(at ?src) )
    :effect (and  (at ?target) (not (at ?src)) (visited ?target)(increase (total-cost) 8))
	)


(:action moveEazy
    :parameters (?src - node ?target - node)
    :precondition(and  (connectEasy ?src ?target)(at ?src) )
    :effect (and  (at ?target) (not (at ?src))(visited ?target) (increase (total-cost) 1))
	)
	
)

