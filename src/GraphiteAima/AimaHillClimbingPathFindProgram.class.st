"
I am a greedy hill climber 
"
Class {
	#name : #AimaHillClimbingPathFindProgram,
	#superclass : #AimaGoalAgentProgram,
	#category : #'GraphiteAima-SearchOnGraph'
}

{ #category : #'as yet unclassified' }
AimaHillClimbingPathFindProgram >> calculateAndSortByHeuristicsNeighboursFrom: current for: problem [
	| neighbours |
	neighbours := (self actionsFor: current for: problem) collect: [ 
		              :action | 
		              self
			              neighbourNodeFor: current
			              problem: problem
			              action: action ].
	^ neighbours asSet asOrderedCollection sort: [ :a :b | 
		  (problem heuristicFunctionFor: a)
		  < (problem heuristicFunctionFor: b) ]
]

{ #category : #'as yet unclassified' }
AimaHillClimbingPathFindProgram >> chooseNextStep: comparison knowingCurrent: current for: problem [

	^ (problem heuristicFunctionFor: comparison first) 	= (problem heuristicFunctionFor: current)
		ifTrue: [ comparison second ]
		ifFalse: [ comparison first ]
]

{ #category : #'as yet unclassified' }
AimaHillClimbingPathFindProgram >> neighbourNodeFor: current problem: problem action: action [
	^ problem apply: action to: current
]

{ #category : #'as yet unclassified' }
AimaHillClimbingPathFindProgram >> solve: problem [ 
	| current neighbours  | 
	current := problem initialState.
	[ true ] whileTrue: [ 
		neighbours :=  self calculateAndSortByHeuristicsNeighboursFrom: current for: problem. 
		current := self chooseNextStep: neighbours knowingCurrent: current for: problem . 
		(self isSolution: current for: problem) ifTrue: [ 
				self registerSolution: current for: problem .
				(self isSolved: problem ) ifTrue:[ ^ problem solution ].
		].
	]
]
