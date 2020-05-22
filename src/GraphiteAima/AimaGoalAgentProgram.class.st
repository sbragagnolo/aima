"
Just a silly abstract class 
"
Class {
	#name : #AimaGoalAgentProgram,
	#superclass : #AimaAgentProgram,
	#category : #'GraphiteAima-Core'
}

{ #category : #'as yet unclassified' }
AimaGoalAgentProgram >> defaultAgentClass [
	^ AimaGoalAgent
]

{ #category : #'as yet unclassified' }
AimaGoalAgentProgram >> solve: problem [ 
	self subclassResponsibility
]
