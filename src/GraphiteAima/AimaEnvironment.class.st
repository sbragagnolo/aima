"
I am a really minimal and abstract environment s
"
Class {
	#name : #AimaEnvironment,
	#superclass : #Object,
	#category : #'GraphiteAima-Core'
}

{ #category : #'as yet unclassified' }
AimaEnvironment >> execute: anAction for: anAgent [
	anAction executeOn: self for: anAgent.
	^ self 
]

{ #category : #'as yet unclassified' }
AimaEnvironment >> perceptionFor: anAgent [
	^ self subclassResponsibility
]
