(define (problem DesignEnvP1)
  (:domain DesignEnvP)
(:init
  (= (total-cost) 0)
  
  (connectGeometry start parallelogram)
  (connectGeometry parallelogram rectangle)
  (connectGeometry rectangle rhombus)
  (connectGeometry rhombus square)
  (connectToEnd square)
  (connectHeightArea parallelogram parallelogramH)
  (connectHeightArea parallelogramH parallelogramA)
  (connectToEnd parallelogramA)
  (connectHeightArea start triangleH)
  (connectHeightArea triangleH triangleA)
  (connectHeightArea triangleA parallelogramH)
  
  (connectDecaimal start decimal0)
  (connectDecaimal decimal0 decimal1)
  (connectDecaimal decimal1 decimal2)
  (connectDecaimal decimal2 fromDecimal)
  (connectToEnd fromDecimal)
  (connectAddSub decimal1 AddSubDecimal0)
  (connectAddSub decimal1 AddSubDecimal1)
  (connectAddSub AddSubDecimal0 AddSubDecimal1)
  (connectToEnd AddSubDecimal1)
  
  (connectNatural start Add)
  (connectNatural Add Sub)
  (connectNatural Sub Mul)
  (connectDivNatural Mul division1)
  (connectDivNatural division1 division2)
  (connectToEnd division2)
  (connectAddSub division1 Order)
  (connectToEnd Order)

  (solved start)
  (at start)

)
(:goal (and 
(at End)
)
)
 (:metric minimize (total-cost))


)
