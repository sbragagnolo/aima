"
A* implementation 

"
Class {
	#name : #AimaAStarPathFindProgram,
	#superclass : #AimaAbstractPathFindProgram,
	#category : #'GraphiteAima-SearchOnGraph'
}

{ #category : #'as yet unclassified' }
AimaAStarPathFindProgram >> calculateSuccessors: node for: aProblem [
	| statesVisitedByThisPath |
	statesVisitedByThisPath := node states.
	^ ((self actionsFor: node for: aProblem)
		collect: [ :action | 
			| child |
			child := self childNode: aProblem parent: node action: action.
			child
				f:
					((self exactCostFunction: child)
						+ (aProblem heuristicCostFunction: child state)
						max: (node f ifNil: [ 0 ])) ]) asOrderedCollection
		reject: [ :c | statesVisitedByThisPath includes: c state ]
]

{ #category : #'as yet unclassified' }
AimaAStarPathFindProgram >> childNode: problem parent: parent action: action [
	^ AimaPathAStarNode new
		state: (problem apply: action to: parent state);
		parent: parent;
		action: action;
		cost: parent cost + (problem actionCost: action to: parent state);
		yourself
]

{ #category : #'as yet unclassified' }
AimaAStarPathFindProgram >> exactCostFunction: aNode [ 
	^ aNode cost
]

{ #category : #'as yet unclassified' }
AimaAStarPathFindProgram >> infinity [
 " Hope it is large enough "
	^  99 factorial 
]

{ #category : #'as yet unclassified' }
AimaAStarPathFindProgram >> initialNode: node [
	^ AimaPathAStarNode new
		state: node;
		parent: nil;
		action: AimaActionEmpty new;
		cost: 0; 
		yourself
]

{ #category : #'as yet unclassified' }
AimaAStarPathFindProgram >> registerSolution: node for: aProblem [
	(aProblem solution values
		anySatisfy: [ :v | node states = v states ])
		ifFalse: [ super registerSolution: node for: aProblem ]
]

{ #category : #'as yet unclassified' }
AimaAStarPathFindProgram >> solve: aProblem [
	self
		solve: aProblem
		for: (self initialNode: aProblem initialState)
		limit: self infinity.
	^ aProblem solution
]

{ #category : #'as yet unclassified' }
AimaAStarPathFindProgram >> solve: aProblem for: node limit: limit [ 
	| successors best second results  | 
	"
		As soon as we discover a success, we finish this execution. 
	"
	(self isSolution: node for: aProblem) ifTrue: [ 
		self registerSolution: node for: aProblem .
		^ { #Success . 0 }.
	].
	successors := self calculateSuccessors: node for: aProblem.


	
	[ true ] whileTrue: [
		" 
			If what ever successor has become to the infinity number that means that is an impossible path. 
			In a normal execution of A* this barely happens, but this version allow the user to claim for more than one fast result. 
			This infinitiy weight path may develop in the way. We want to be sure that these successors are not taken seriously. 
		"
		successors ifEmpty: [ ^{ #Failure . #DeadEnd } ].
		
		" We use sorting for getting the first and second first. This may be a place for performance enhancement "
		successors := successors sort: [ : a : b  | a f < b f ].
		best := successors first. 
		second := successors size > 1 ifTrue: [ successors second ] ifFalse: [ best ].
		best f > limit ifTrue: [ ^ { #Failure . best f }   ].
		results := self solve: aProblem for: best limit: (limit min: second f).
		
		(results first = #Success) ifTrue: [  
			" 
				If the result has being a success, we remove this path of the possibilities. 
				If we reached the desire amount of successes, we finish. If not, we keep running. 
			"
			successors remove: best.
			(successors isEmpty or: [ self isSolved: aProblem ]) ifTrue: [ 
				^ { #Success . 0 }.
			].
		] ifFalse: [
			results second = #DeadEnd ifTrue: [ 
				" This path went to nonsense "
				successors remove: best. 	
			 ] ifFalse: [ 
				best f: results second.
			 ]
			" 
				This path may fail because of being a dead end, or because the price is to high
			"
			
	"		successors size = 1 ifTrue: [ ^ { #Failure . best f }  ]."
		].
	]
	
	
	
		
		
	
]
