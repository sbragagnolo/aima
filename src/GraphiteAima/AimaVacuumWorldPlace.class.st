"
Vacuum Environment's place 
"
Class {
	#name : #AimaVacuumWorldPlace,
	#superclass : #Object,
	#instVars : [
		'agent',
		'state'
	],
	#category : #'GraphiteAima-VacuumWorld-Environment'
}

{ #category : #testing }
AimaVacuumWorldPlace >> addAgent: anAgent [
	agent := anAgent 
]

{ #category : #testing }
AimaVacuumWorldPlace >> clean [
	state := #clean.
]

{ #category : #testing }
AimaVacuumWorldPlace >> hasTheAgent: anAgent [ 
	^ agent = anAgent 
]

{ #category : #testing }
AimaVacuumWorldPlace >> letItDirt [
	state := #dirty.
]

{ #category : #testing }
AimaVacuumWorldPlace >> removeAgent: anAgent [
	agent = anAgent
		ifTrue: [ agent := nil ]
]

{ #category : #testing }
AimaVacuumWorldPlace >> state [ 
	^ state
]
