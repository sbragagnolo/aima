"
perceives, decides what to do by asking the program, actuates .
"
Class {
	#name : #AimaAgent,
	#superclass : #Object,
	#instVars : [
		'actuator',
		'sensor',
		'agentProgram'
	],
	#category : #'GraphiteAima-Core'
}

{ #category : #accessing }
AimaAgent class >> default [
	^ self new
		actuator: AimaSimpleActuator new;
		sensor: AimaIdentitySensor new;
		yourself
]

{ #category : #'as yet unclassified' }
AimaAgent >> actuator: anAimaSimpleActuator [ 
	actuator := anAimaSimpleActuator
]

{ #category : #'as yet unclassified' }
AimaAgent >> agentProgram [
	^ agentProgram
]

{ #category : #accessing }
AimaAgent >> agentProgram: aProgram [
	agentProgram := aProgram
]

{ #category : #running }
AimaAgent >> execute: anEnvironment [
	| perceptions actions |
	perceptions := sensor perceive: anEnvironment for: self.
	actions := perceptions
		collect: [ :perception | agentProgram actionFor: perception for: self in: anEnvironment ].
	^ actuator apply: actions last into: anEnvironment for: self
]

{ #category : #'as yet unclassified' }
AimaAgent >> sensor: anAimaIdentitySensor [ 
	sensor := anAimaIdentitySensor
]
