"
The abstract thing
"
Class {
	#name : #AimaAgent,
	#superclass : #Object,
	#instVars : [
		'agentProgram'
	],
	#category : #'GraphiteAima-Core'
}

{ #category : #'as yet unclassified' }
AimaAgent >> agentProgram [
	^ agentProgram
]

{ #category : #accessing }
AimaAgent >> agentProgram: aProgram [
	agentProgram := aProgram
]

{ #category : #accessing }
AimaAgent >> execute: anEnvironment [
	self subclassResponsibility 
]
