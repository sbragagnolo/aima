"
I am a deep first with limits. 

I am a recursive implementation. 

I have a small modification from the original algorithm, i do not allow the actions to take me to the previous node, to allow short undesirable recursions.
I am mean to be useful for graphs of what ever kind. non directed too. 

By other hand, the treatment of cylic nature of the graph, is left to the problem, since each problem may have to resolve it differently .
"
Class {
	#name : #AimaDepthFirstPathFindProgram,
	#superclass : #AimaAbstractPathFindProgram,
	#category : #'GraphiteAima-SearchOnGraph'
}

{ #category : #'as yet unclassified' }
AimaDepthFirstPathFindProgram >> actionsFor: node for: problem [
	^ problem actionsFor: node state
]

{ #category : #'as yet unclassified' }
AimaDepthFirstPathFindProgram >> childNode: problem parent: parent action: action [
	^ AimaPathNode new
		state: (problem apply: action to: parent state);
		parent: parent;
		action: action;
		yourself
]

{ #category : #'as yet unclassified' }
AimaDepthFirstPathFindProgram >> initialNode: node [
	^ AimaPathNode new
		state: node;
		parent: nil;
		action: AimaActionEmpty new;
		yourself
]

{ #category : #'as yet unclassified' }
AimaDepthFirstPathFindProgram >> isSolved: aSolution for: aProblem [
	^ aProblem isSolution: aSolution
]

{ #category : #'as yet unclassified' }
AimaDepthFirstPathFindProgram >> solve: problem [
	^ self solve: problem limit: (problem size min: 10)
]

{ #category : #'as yet unclassified' }
AimaDepthFirstPathFindProgram >> solve: problem for: node limit: limit [ 
	|doneInThisPath|
	(self isSolution: node for: problem) ifTrue: [ 
		self registerSolution: node for: problem .
		^ problem solution
	].
	limit = 0 ifTrue: [ 
		 #LimitReached.
		^ problem solution.
	].

	doneInThisPath := node states.
		
	(self actionsFor: node for: problem ) do:[ : action |
		| child   |
			child := self childNode: problem parent: node action: action.
			( doneInThisPath includes: child state ) ifFalse: [
				self solve: problem for: child limit: limit -1.
				(self isSolved: problem) ifTrue: [ 
					^ problem solution
				]
			]
	].
	^ problem solution 
		
	
]

{ #category : #'as yet unclassified' }
AimaDepthFirstPathFindProgram >> solve: problem limit: limit [
	^ self
		solve: problem
		for: (self initialNode: problem initialState)
		limit: limit
]
