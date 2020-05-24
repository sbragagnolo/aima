"
Ia am a really generic path finder program 
"
Class {
	#name : #AimaAbstractPathFindProgram,
	#superclass : #AimaGoalAgentProgram,
	#category : #'GraphiteAima-SearchOnGraph'
}

{ #category : #'as yet unclassified' }
AimaAbstractPathFindProgram >> actionsFor: aState for: anAgent in: anEnvironment [
	^ (anEnvironment allDestinationsFrom: aState)
		collect: [ :d | 
			AimaGraphStepInto new
				destination: d;
				yourself ]
]

{ #category : #'as yet unclassified' }
AimaAbstractPathFindProgram >> childNode: problem parent: parent action: action [
	^ self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
AimaAbstractPathFindProgram >> initialNode: node [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
AimaAbstractPathFindProgram >> isSolution: node for: aProblem [
	^ ({#Failure . #LimitReached} includes: node) not
		and: [ aProblem isSolution: node state ]
]

{ #category : #'as yet unclassified' }
AimaAbstractPathFindProgram >> isSolved: aProblem [
	^ aProblem isSolved
]

{ #category : #'as yet unclassified' }
AimaAbstractPathFindProgram >> registerSolution: node for: aProblem [
	aProblem registerSolution: node
]
