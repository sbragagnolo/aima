"
Action: Suck!
"
Class {
	#name : #AimaVacuumSuck,
	#superclass : #AimaAction,
	#category : #'GraphiteAima-VacuumWorld-Actions'
}

{ #category : #'as yet unclassified' }
AimaVacuumSuck >> executeOn: anEnvironment for: anAgent [
	(anEnvironment letTheAgentClean: anAgent) .
	^ anEnvironment 
]
