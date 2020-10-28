Class {
	#name : #AimaColoringAustraliaTest,
	#superclass : #GTEAbstractGraphTest,
	#instVars : [
		'problem'
	],
	#category : #'GraphiteAima-WorldAustralia'
}

{ #category : #running }
AimaColoringAustraliaTest >> setUp [
	super setUp.
	graph useWeightedArcResolver.
	problem := AimaStateSearchProblem new environment:
		           (AimaAustralia new
			            initializeWith: graph;
			            yourself)
]
