(define (domain designenvp)
(:requirements :strips :action-costs)
(:functions (total-cost))
(:types node - object)
(:constants
 start - node 
 parallelogram - node
 rectangle - node
 rhombus - node
 square - node
 parallelogramH - node
 parallelogramA - node
 triangleH - node
 triangleA - node
 decimal0 - node
 decimal1 - node
 decimal2 - node
 fromDecimal - node
 AddSubDecimal0 - node
 AddSubDecimal1 - node
 Add - node
 Sub - node
 Mul - node
 division1 - node
 division2 - node
 Order - node
 End - node

)

(:predicates
(connectGeometry ?src - node ?target - node )
(connectHeightArea ?src - node ?target - node)
(connectMul ?src - node ?target - node)
(connectDiv ?src - node ?target - node)
(connectDecaimal ?src - node ?target - node)
(connectAddSub ?src - node ?target - node)
(connectToEnd ?src - node)


(at ?src - node)
(solved ?target - node)
(goalAchieved)
)

(:action geometry
:parameters ( ?src - node ?target - node )
:precondition 
(and (connectGeometry ?src ?target) (solved ?src))
:effect (and (at ?target) (increase (total-cost) 5)
(solved ?target) )
)

(:action HeightArea
:parameters ( ?src - node ?target - node )
:precondition 
(and  (connectHeightArea ?src ?target) (solved ?src))
:effect (and (at ?target) (increase (total-cost) 10)
(solved ?target) )
)

(:action connectToEnd
:parameters (?src - node)
:precondition 
(and  (connectToEnd ?src) (solved ?src) )
:effect (and (at End) )
)

(:action giveUp
:parameters ( ?src - node)
:precondition 
(and  (connectToEnd ?src) )
:effect (and (at End) (increase (total-cost) 1000))
)


)
