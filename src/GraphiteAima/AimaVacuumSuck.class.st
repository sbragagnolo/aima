"
Action: Suck!
"
Class {
	#name : #AimaVacuumSuck,
	#superclass : #AimaAction,
	#category : #'GraphiteAima-WorldVacuum'
}

{ #category : #'as yet unclassified' }
AimaVacuumSuck >> executeOn: anEnvironment for: anAgent [
	(anEnvironment letTheAgentClean: anAgent) .
	^ anEnvironment 
]
