"
Vacuum Environment
"
Class {
	#name : #AimaVacuumWorld,
	#superclass : #AimaEnvironment,
	#instVars : [
		'left',
		'right'
	],
	#category : #'GraphiteAima-VacuumWorld-Environment'
}

{ #category : #'as yet unclassified' }
AimaVacuumWorld >> agent: anAgent [
	right removeAgent: anAgent .
	left removeAgent: anAgent .
	(1000 atRandom > 500
		ifTrue: [ right ]
		ifFalse: [ left ]) addAgent: anAgent
]

{ #category : #'as yet unclassified' }
AimaVacuumWorld >> initialize [
	left := AimaVacuumWorldPlace new
		letItDirt;
		yourself.
	right := AimaVacuumWorldPlace new
		letItDirt;
		yourself
]

{ #category : #'as yet unclassified' }
AimaVacuumWorld >> left [
	^ left
]

{ #category : #'as yet unclassified' }
AimaVacuumWorld >> letTheAgentClean: anAgent [
	^ (self placeWhereAgentIs: anAgent) clean
]

{ #category : #'as yet unclassified' }
AimaVacuumWorld >> moveAgentToLeft: anAgent [
	right removeAgent: anAgent.
	left addAgent: anAgent
]

{ #category : #'as yet unclassified' }
AimaVacuumWorld >> moveAgentToRight: anAgent [
	left removeAgent: anAgent.
	right addAgent: anAgent
]

{ #category : #'as yet unclassified' }
AimaVacuumWorld >> perceptionFor: anAgent [
	^ (self placeWhereAgentIs: anAgent) state
]

{ #category : #'as yet unclassified' }
AimaVacuumWorld >> placeWhereAgentIs: anAgent [
	^ (left hasTheAgent: anAgent)
		ifTrue: [ left ]
		ifFalse: [ right ]
]

{ #category : #'as yet unclassified' }
AimaVacuumWorld >> right [ 
	^ right
]

{ #category : #'as yet unclassified' }
AimaVacuumWorld >> whereIsTheAgent: anAgent [
	^ (left hasTheAgent: anAgent)
		ifTrue: [ #left ]
		ifFalse: [ #right ]
]
