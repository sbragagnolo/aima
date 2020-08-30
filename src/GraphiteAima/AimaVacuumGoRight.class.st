"
Action: Go Right
"
Class {
	#name : #AimaVacuumGoRight,
	#superclass : #AimaAction,
	#category : #'GraphiteAima-WorldVacuum-Actions'
}

{ #category : #'as yet unclassified' }
AimaVacuumGoRight >> executeOn: anEnvironment for: anAgent [
	anEnvironment moveAgentToRight: anAgent.
	^ anEnvironment
]
