"
I am an actual action .
"
Class {
	#name : #AimaAction,
	#superclass : #Object,
	#category : #'GraphiteAima-Core'
}

{ #category : #'as yet unclassified' }
AimaAction >> executeOn: anEnvironment for: anAgent [
	self subclassResponsibility
]
