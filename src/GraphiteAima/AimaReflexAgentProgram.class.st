"
it reifys the idea of agentFunction .
"
Class {
	#name : #AimaReflexAgentProgram,
	#superclass : #AimaAgentProgram,
	#category : #'GraphiteAima-Core'
}

{ #category : #'as yet unclassified' }
AimaReflexAgentProgram >> actionsFor: perception for: anAgent in: anEnvironment [ 
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
AimaReflexAgentProgram >> defaultAgent [
	^ super defaultAgent
		actuator: AimaSimpleActuator new;
		sensor: AimaIdentitySensor new;
		yourself
]

{ #category : #'as yet unclassified' }
AimaReflexAgentProgram >> defaultAgentClass [
	^ AimaReflexAgent
]
