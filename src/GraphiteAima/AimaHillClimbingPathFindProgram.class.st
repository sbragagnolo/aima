"
I am a greedy hill climber 
"
Class {
	#name : #AimaHillClimbingPathFindProgram,
	#superclass : #AimaGoalAgentProgram,
	#category : #'GraphiteAima-SearchOnGraph'
}

{ #category : #'as yet unclassified' }
AimaHillClimbingPathFindProgram >> neighbourNodeFor: current problem: problem action: action [
	^ problem apply: action to: current
]

{ #category : #'as yet unclassified' }
AimaHillClimbingPathFindProgram >> solve: problem [ 
	| current neighbours comparison | 
	current := problem initialState.
	[ true ] whileTrue: [ 
		neighbours :=  
		(self actionsFor: current for: problem ) collect:[ : action |
			self neighbourNodeFor: current  problem: problem action: action.
		].
		comparison := (neighbours, { current }) sort:[ :a :b |
			(problem heuristicFunctionFor: a) < (problem heuristicFunctionFor: b) 	
		].
		comparison first = current ifTrue: [ 	
				(self isSolution: current for: problem) ifTrue: [ 
					self registerSolution: current for: problem .
					(self isSolved: problem ) ifTrue:[ ^ problem solution ].
				].
				current := comparison second. 
	 	] ifFalse: [ current := comparison first ].
	]
]
