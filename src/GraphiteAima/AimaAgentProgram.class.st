"
it reifys the idea of agentFunction .
"
Class {
	#name : #AimaAgentProgram,
	#superclass : #Object,
	#category : #'GraphiteAima-Core'
}

{ #category : #'as yet unclassified' }
AimaAgentProgram >> actionFor: perception for: anAgent in: anEnvironment [ 
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
AimaAgentProgram >> defaultAgent [
	^ AimaAgent new
		actuator: AimaSimpleActuator new;
		sensor: AimaIdentitySensor new;
		agentProgram: self;
		yourself
]
