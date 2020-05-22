"
silly abstract class 
"
Class {
	#name : #AimaAgentProgram,
	#superclass : #Object,
	#category : #'GraphiteAima-Core'
}

{ #category : #'as yet unclassified' }
AimaAgentProgram >> defaultAgent [
	^ self defaultAgentClass new
		agentProgram: self;
		yourself
]

{ #category : #'as yet unclassified' }
AimaAgentProgram >> defaultAgentClass [
	^ self subclassResponsibility 
]
