"
Action: Go Left
"
Class {
	#name : #AimaVacuumGoLeft,
	#superclass : #AimaAction,
	#category : #'GraphiteAima-WorldVacuum'
}

{ #category : #'as yet unclassified' }
AimaVacuumGoLeft >> executeOn: anEnvironment for: anAgent [
	anEnvironment moveAgentToLeft: anAgent.
	^ anEnvironment
]
