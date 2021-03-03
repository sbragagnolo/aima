Class {
	#name : #AimaColoringAustraliaTest,
	#superclass : #GTEAbstractGraphTest,
	#instVars : [
		'problem'
	],
	#category : #'GraphiteAima-WorldAustralia'
}

{ #category : #running }
AimaColoringAustraliaTest >> constraintProgram [

	^ AimaConstraintSatisfactionProgram new defaultAgent
]

{ #category : #running }
AimaColoringAustraliaTest >> setUp [

	super setUp.
	graph useWeightedArcResolver.
	problem := AimaConstraintsProblem new
		           environment: (AimaAustralia new
				            initializeWith: graph;
				            yourself);
		           yourself
]

{ #category : #running }
AimaColoringAustraliaTest >> testThereIsAtLeastOneSolution [
	| solutions |
	problem solution: AimaSolution single.
	solutions := self constraintProgram execute: problem.
	self assert: solutions size equals: 1
]
