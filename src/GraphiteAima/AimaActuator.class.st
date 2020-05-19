"
Actuator decides how to apply an action 
"
Class {
	#name : #AimaActuator,
	#superclass : #Object,
	#category : #'GraphiteAima-Core'
}

{ #category : #'as yet unclassified' }
AimaActuator >> apply: action into: anEnvironment for: anAgent [
	self subclassResponsibility
]
