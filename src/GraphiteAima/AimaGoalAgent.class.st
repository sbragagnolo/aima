"
I am just a silly agent 
"
Class {
	#name : #AimaGoalAgent,
	#superclass : #AimaAgent,
	#category : #'GraphiteAima-Core'
}

{ #category : #running }
AimaGoalAgent >> execute: aProblem [
	^ agentProgram solve: aProblem 
]
