(define (problem DesignEnvP1)
  (:domain DesignEnvP)
(:init
  (= (total-cost) 0)
	(connectMeduim node10 node6)
	(connectEasy node1 node2)
	(connectMeduim node6 node5)
	(connectEasy node8 node12)
	(connectEasy node4 node3)

	(connectMeduim node6 node2)
	(connectEasy node2 node3)
	(connectEasy node5 node1)
	(connectEasy node9 node5)
	(connectEasy node8 node4)
	(connectMeduim node7 node3)
	(connectMeduim node11 node7)
	(connectEasy node10 node11)
	(connectEasy node12 node11)
	(connectEasy node10 node9)
	(connectMeduim node7 node8)
	(connectMeduim node6 node7)
	
	(connectMeduim node6 node10)
	(connectEasy node2 node1)
	(connectMeduim node5 node6)
	(connectEasy node12 node8)
	(connectEasy node3 node4)
	(connectMeduim node2 node6)

	(connectEasy node3 node2)
	(connectEasy node1 node5)
	(connectEasy node5 node9)
	(connectEasy node4 node8)
	(connectMeduim node3 node7)
	(connectMeduim node7 node11)
	(connectEasy node11 node10)
	(connectEasy node11 node12)
	(connectEasy node9 node10)
	(connectMeduim node8 node7)
	(connectMeduim node7 node6)
	(at node4)

)
(:goal (and 
(visited node9)
)
)
 (:metric minimize (total-cost))


)
