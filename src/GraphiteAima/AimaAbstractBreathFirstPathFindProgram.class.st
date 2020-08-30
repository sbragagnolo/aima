"
I am a breath first solution 
"
Class {
	#name : #AimaAbstractBreathFirstPathFindProgram,
	#superclass : #AimaAbstractPathFindProgram,
	#instVars : [
		'frontier',
		'explored'
	],
	#category : #'GraphiteAima-Search'
}

{ #category : #'as yet unclassified' }
AimaAbstractBreathFirstPathFindProgram >> isSolved: aProblem [
	^ frontier isEmpty or: [ super isSolved: aProblem ]
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
AimaAbstractBreathFirstPathFindProgram >> solve: aProblem [
	| node |
	self prepareForSolving.
	node := self initialNode: aProblem initialState.
	(self isSolution: node for: aProblem)
		ifTrue: [ self registerSolution: node for: aProblem ].
	self registerNewFrontier: node.
	[ self isSolved: aProblem ]
		whileFalse: [ node := self pickNextNode.
			(self actionsFor: node for: aProblem )
				do: [ :action | 
					| child |
					child := self childNode: aProblem parent: node action: action.
					(self isSolution: child for: aProblem)
						ifTrue: [ self registerSolution: child for: aProblem ]
						ifFalse: [ self registerNewFrontier: child ] ] ].
	^ aProblem solution
]
