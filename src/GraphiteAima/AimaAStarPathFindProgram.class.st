"
A* implementation 

"
Class {
	#name : #AimaAStarPathFindProgram,
	#superclass : #AimaAbstractPathFindProgram,
	#category : #'GraphiteAima-SearchOnGraph'
}

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
AimaAStarPathFindProgram >> solve: aProblem [
	self
		solve: aProblem
		for: (self initialNode: aProblem initialState)
		limit: self infinity.
	^ aProblem solution
]

{ #category : #'as yet unclassified' }
AimaAStarPathFindProgram >> solve: aProblem for: node limit: limit [ 
	| successors best second results statesVisitedByThisPath | 
	(self isSolution: node for: aProblem) ifTrue: [ 
		self registerSolution: node for: aProblem .
		^ { #Success . 0 }.
	].
	successors := 	
	((self actionsFor: node for: aProblem ) collect:[ : action | 
		| child | 
		child := self childNode: aProblem parent: node action: action.
		child f:(( (self exactCostFunction: child) + (aProblem heuristicCostFunction: child state)) max:( node f ifNil: [0] ))
	]) asOrderedCollection .
	statesVisitedByThisPath := node states.

	
	[ true ] whileTrue: [
		successors := successors reject:[ : c | (statesVisitedByThisPath includes: c state ) or: [ c f = self infinity ] ].
		successors ifEmpty: [ ^{ #Failure . self infinity } ].
		successors := successors sort: [ : a : b  | a f < b f ].
		best := successors first. 
		second := successors size > 1 ifTrue: [ successors second ] ifFalse: [ best ].
		best f > limit ifTrue: [ ^ { #Failure . best f }   ].
		results := self solve: aProblem for: best limit: (limit min: second f).
		
		(results first ~= #Failure) ifTrue: [  
			successors remove: best.
			(successors isEmpty or: [ self isSolved: aProblem ]) ifTrue: [ ^ { #Success . 0 }.].
		] ifFalse: [
			best f: results second.
			successors size = 1 ifTrue: [ ^ { #Failure . best f }  ].
		].
	]
	
	
	
		
		
	
]
