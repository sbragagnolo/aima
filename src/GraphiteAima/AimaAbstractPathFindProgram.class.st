"
Ia am a really generic path finder program 
"
Class {
	#name : #AimaAbstractPathFindProgram,
	#superclass : #AimaGoalAgentProgram,
	#category : #'GraphiteAima-SearchOnGraph'
}

{ #category : #'as yet unclassified' }
AimaAbstractPathFindProgram >> childNode: problem parent: parent action: action [
	^ self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
AimaAbstractPathFindProgram >> initialNode: node [
	^ self subclassResponsibility
]
