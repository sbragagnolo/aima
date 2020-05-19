"
It just apply directly 
"
Class {
	#name : #AimaSimpleActuator,
	#superclass : #AimaActuator,
	#category : #'GraphiteAima-Core'
}

{ #category : #'as yet unclassified' }
AimaSimpleActuator >> apply: action into: anEnvironment for: anAgent [
	^ anEnvironment execute: action for: anAgent
]
