"
I am a breath first solution 
"
Class {
	#name : #AimaBreathFirstPathFindProgram,
	#superclass : #AimaGoalAgentProgram,
	#instVars : [
		'frontier',
		'explored'
	],
	#category : #'GraphiteAima-SearchOnGraph'
}

{ #category : #'as yet unclassified' }
AimaBreathFirstPathFindProgram >> actionsFor: aCity for: anAgent in: aRomaniaEnvironment [
	^ (aRomaniaEnvironment allDestinationsFrom: aCity)
		collect: [ :d | 
			AimaGraphStepInto new
				destination: d;
				yourself ]
]

{ #category : #'as yet unclassified' }
AimaBreathFirstPathFindProgram >> childNode: problem parent: parent action: action [
	^ AimaPathCostNode new
		state: (problem apply: action to: parent state);
		parent: parent;
		action: action;
		cost: parent cost + (problem actionCost: action to: parent state);
		yourself
]

{ #category : #'as yet unclassified' }
AimaBreathFirstPathFindProgram >> initialNode: node [
	^ AimaPathCostNode new
		state: node;
		parent: nil;
		action: AimaActionEmpty new;
		cost: 0;
		yourself
]

{ #category : #'as yet unclassified' }
AimaBreathFirstPathFindProgram >> isSolved: aProblem [
	^ frontier isNotEmpty and: [ aProblem isSolved not ]
]

{ #category : #'as yet unclassified' }
AimaBreathFirstPathFindProgram >> pickNextNode [
	| node |
	node := frontier removeFirst.
	explored add: node state.
	^ node
]

{ #category : #'as yet unclassified' }
AimaBreathFirstPathFindProgram >> prepareForSolving [
	frontier := OrderedCollection new.
	explored := Set new
]

{ #category : #accessing }
AimaBreathFirstPathFindProgram >> registerNewFrontier: child [
	((frontier includes: child) or: [ explored includes: child state ])
		ifFalse: [ frontier add: child ]
]

{ #category : #'as yet unclassified' }
AimaBreathFirstPathFindProgram >> solve: aProblem [
	| node |
	self prepareForSolving. 
	node := self initialNode: aProblem initialState.
	(aProblem isSolution: node state)
		ifTrue: [ aProblem registerSolution: node ].
	self registerNewFrontier: node.
	[ self isSolved: aProblem ] whileTrue: [
			 node := self pickNextNode.
			(aProblem actionsFor: node state) do: [ :action | 
				| child |
				child := self childNode: aProblem parent: node action: action.
				(aProblem isSolution: child state) ifTrue: [ aProblem registerSolution: child ].
				self registerNewFrontier: child
			]
		].
	^ aProblem solution
]
