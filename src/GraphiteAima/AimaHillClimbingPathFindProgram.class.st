"
I am a greedy hill climber 
"
Class {
	#name : #AimaHillClimbingPathFindProgram,
	#superclass : #AimaGoalAgentProgram,
	#instVars : [
		'amountOfConcurrentStates'
	],
	#category : #'GraphiteAima-Search'
}

{ #category : #'as yet unclassified' }
AimaHillClimbingPathFindProgram >> amountOfConcurrentStates: anAmount [
	amountOfConcurrentStates := anAmount  	
]

{ #category : #'as yet unclassified' }
AimaHillClimbingPathFindProgram >> calculateAndSortByHeuristicsNeighboursFrom: currentStates for: problem [
	| neighbours |
	neighbours := currentStates flatCollect: [ :current|  (self actionsFor: current for: problem) collect: [ 
		              :action | 
		              self 
			              neighbourNodeFor: current
			              problem: problem
			              action: action ]].
	^ neighbours asSet asOrderedCollection sort: [ :a :b | 
		  (problem heuristicFunctionFor: a)
		  < (problem heuristicFunctionFor: b) ]
]

{ #category : #'as yet unclassified' }
AimaHillClimbingPathFindProgram >> chooseNextStep: possibleStates knowingCurrent: current for: problem [

	^ possibleStates first: amountOfConcurrentStates 
]

{ #category : #'as yet unclassified' }
AimaHillClimbingPathFindProgram >> initialize [ 
	super initialize .
	amountOfConcurrentStates := 1 .
]

{ #category : #'as yet unclassified' }
AimaHillClimbingPathFindProgram >> neighbourNodeFor: current problem: problem action: action [
	^ problem apply: action to: current
]

{ #category : #'as yet unclassified' }
AimaHillClimbingPathFindProgram >> solve: problem [ 
	| currentStates neighbours  | 
	currentStates := {problem initialState}.
	[ true ] whileTrue: [ 
		neighbours :=  self calculateAndSortByHeuristicsNeighboursFrom: currentStates for: problem. 
		currentStates := self chooseNextStep: neighbours knowingCurrent: currentStates for: problem . 
		(self isSolution: currentStates first for: problem) ifTrue: [ 
				self registerSolution: currentStates first for: problem .
				(self isSolved: problem ) ifTrue:[ ^ problem solution ].
		].
	]
]
