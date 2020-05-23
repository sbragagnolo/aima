"
I am a breath first solution 
"
Class {
	#name : #AimaAbstractBreathFirstPathFindProgram,
	#superclass : #AimaGoalAgentProgram,
	#instVars : [
		'frontier',
		'explored'
	],
	#category : #'GraphiteAima-SearchOnGraph'
}

{ #category : #'as yet unclassified' }
AimaAbstractBreathFirstPathFindProgram >> actionsFor: aCity for: anAgent in: aRomaniaEnvironment [
	^ (aRomaniaEnvironment allDestinationsFrom: aCity)
		collect: [ :d | 
			AimaGraphStepInto new
				destination: d;
				yourself ]
]

{ #category : #'as yet unclassified' }
AimaAbstractBreathFirstPathFindProgram >> childNode: problem parent: parent action: action [
	^ self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
AimaAbstractBreathFirstPathFindProgram >> initialNode: node [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
AimaAbstractBreathFirstPathFindProgram >> isSolution: node for: aProblem [
	^ (aProblem isSolution: node state)
		ifTrue: [
			true ]
		ifFalse: [ false ]
]

{ #category : #'as yet unclassified' }
AimaAbstractBreathFirstPathFindProgram >> isSolved: aProblem [
	^ frontier isNotEmpty and: [ aProblem isSolved not ]
]

{ #category : #'as yet unclassified' }
AimaAbstractBreathFirstPathFindProgram >> pickNextNode [
	| node |
	node := frontier removeFirst.
	explored add: node state.
	^ node
]

{ #category : #'as yet unclassified' }
AimaAbstractBreathFirstPathFindProgram >> prepareForSolving [
	frontier := OrderedCollection new.
	explored := Set new
]

{ #category : #accessing }
AimaAbstractBreathFirstPathFindProgram >> registerNewFrontier: child [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
AimaAbstractBreathFirstPathFindProgram >> registerSolution: node for: aProblem [
	aProblem registerSolution: node
]

{ #category : #'as yet unclassified' }
AimaAbstractBreathFirstPathFindProgram >> solve: aProblem [
	| node |
	self prepareForSolving.
	node := self initialNode: aProblem initialState.
	(self isSolution: node for: aProblem)
		ifTrue: [ self registerSolution: node for: aProblem ].
	self registerNewFrontier: node.
	[ self isSolved: aProblem ]
		whileTrue: [ node := self pickNextNode.
			(aProblem actionsFor: node state)
				do: [ :action | 
					| child |
					child := self childNode: aProblem parent: node action: action.
					(self isSolution: child for: aProblem)
						ifTrue: [ self registerSolution: child for: aProblem ]
						ifFalse: [ self registerNewFrontier: child ] ] ].
	^ aProblem solution
]
