"
Action: Go Right
"
Class {
	#name : #AimaVacuumGoRight,
	#superclass : #AimaAction,
	#category : #'GraphiteAima-WorldVacuum'
}

{ #category : #'as yet unclassified' }
AimaVacuumGoRight >> executeOn: anEnvironment for: anAgent [
	anEnvironment moveAgentToRight: anAgent.
	^ anEnvironment
]
