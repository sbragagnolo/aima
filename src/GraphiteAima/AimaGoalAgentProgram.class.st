"
Just a silly abstract class 
"
Class {
	#name : #AimaGoalAgentProgram,
	#superclass : #AimaAgentProgram,
	#category : #'GraphiteAima-Core'
}

{ #category : #'as yet unclassified' }
AimaGoalAgentProgram >> actionsFor: node for: problem [
	^ problem actionsFor: node
]

{ #category : #'as yet unclassified' }
AimaGoalAgentProgram >> defaultAgentClass [
	^ AimaGoalAgent
]

{ #category : #'as yet unclassified' }
AimaGoalAgentProgram >> isSolution: node for: aProblem [
	^ aProblem isSolution: node state 
]

{ #category : #'as yet unclassified' }
AimaGoalAgentProgram >> isSolved: aProblem [
	^ aProblem isSolved
]

{ #category : #'as yet unclassified' }
AimaGoalAgentProgram >> registerSolution: node for: aProblem [
	aProblem registerSolution: node
]

{ #category : #'as yet unclassified' }
AimaGoalAgentProgram >> solve: problem [ 
	self subclassResponsibility
]
