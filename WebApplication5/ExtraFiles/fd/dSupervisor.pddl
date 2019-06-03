(define (domain designenvp)
(:requirements :strips :action-costs)
(:functions (total-cost))
(:types box location)
(:constants
 box1 - box
 box2 - box
 box3 - box
 loc1 - location
 loc2 - location
 loc3 - location
 loc4 - location
 loc5 - location
 loc6 - location
)

(:predicates
(clear ?x - box)
(cleartable ?x - location)
(ontable ?x - box)
(armempty)
(holding ?x - box)
(on ?x - box ?y - box)
(armat ?loc - location)
(boxat ?x - box ?loc - location)
(connect ?lo1 - location ?lo2 - location)
(goalAchieved)
)

(:action pickup-loc
:parameters ( ?bo - box ?loc - location)
:precondition 
(and (clear ?bo) (ontable ?bo) (armempty ) (armat ?loc) (boxat ?bo ?loc) (not (cleartable ?loc)))
:effect 
(and (holding ?bo) (not (clear ?bo)) (not (ontable ?bo)) (not (boxat ?bo ?loc)) (not (armempty )) (cleartable ?loc) (increase (total-cost) 1))
)

(:action putdown-loc
:parameters ( ?bo - box ?loc - location)
:precondition 
(and (holding ?bo) (armat ?loc) (cleartable ?loc))
:effect 
(and (clear ?bo) (armempty ) (ontable ?bo) (boxat ?bo ?loc) (not (holding ?bo)) (not (cleartable ?loc)) (increase (total-cost) 1))
)

(:action stack-loc
:parameters ( ?bo - box ?underbox - box ?loc - location)
:precondition 
(and (clear ?underbox) (holding ?bo) (armat ?loc))
:effect 
(and (armempty ) (clear ?bo) (on ?bo ?underbox) (boxat ?bo ?loc) (not (clear ?underbox)) (not (holding ?bo)) (increase (total-cost) 1))
)

(:action unstack-loc
:parameters ( ?bo - box ?underbox - box ?loc - location)
:precondition 
(and (on ?bo ?underbox) (clear ?bo) (armempty ) (armat ?loc) (boxat ?bo ?loc))
:effect 
(and (holding ?bo) (clear ?underbox) (not (boxat ?bo ?loc)) (not (on ?bo ?underbox)) (not (clear ?bo)) (not (armempty )) (increase (total-cost) 1))
)

(:action move-empty-arm
:parameters ( ?lo1 - location ?lo2 - location)
:precondition 
(and (armempty ) (armat ?lo1) (connect ?lo1 ?lo2))
:effect 
(and (not (armat ?lo1)) (armat ?lo2) (increase (total-cost) 1))
)

(:action move-arm
:parameters ( ?lo1 - location ?lo2 - location ?bo - box)
:precondition 
(and (not (armempty )) (holding ?bo) (armat ?lo1) (connect ?lo1 ?lo2))
:effect 
(and (not (armat ?lo1)) (armat ?lo2) (increase (total-cost) 2))
)

(:action finish
:precondition 
(and (not (boxat box1 loc2)) (boxAt box2 loc3 ) (boxAt box3 loc2 ))
:effect 
(and (goalAchieved ))
)

)
