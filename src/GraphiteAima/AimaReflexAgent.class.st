"
perceives, decides what to do by asking the program, actuates .
"
Class {
	#name : #AimaReflexAgent,
	#superclass : #AimaAgent,
	#instVars : [
		'actuator',
		'sensor'
	],
	#category : #'GraphiteAima-Core'
}

{ #category : #accessing }
AimaReflexAgent class >> default [
	^ self new
		actuator: AimaSimpleActuator new;
		sensor: AimaIdentitySensor new;
		yourself
]

{ #category : #'as yet unclassified' }
AimaReflexAgent >> actuator: anAimaSimpleActuator [ 
	actuator := anAimaSimpleActuator
]

{ #category : #running }
AimaReflexAgent >> execute: anEnvironment [
	| perceptions actions |
	perceptions := sensor perceive: anEnvironment for: self.
	actions := perceptions
		collect: [ :perception | agentProgram actionsFor: perception for: self in: anEnvironment ].
	^ actuator apply: actions last into: anEnvironment for: self
]

{ #category : #'as yet unclassified' }
AimaReflexAgent >> sensor: anAimaIdentitySensor [ 
	sensor := anAimaIdentitySensor
]
