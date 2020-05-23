Class {
	#name : #AimaSearchRomaniaTest,
	#superclass : #GTEAbstractGraphTest,
	#instVars : [
		'agent',
		'problem'
	],
	#category : #'GraphiteAima-Romania'
}

{ #category : #running }
AimaSearchRomaniaTest >> runCaseManaged [
	^ self runCase
]

{ #category : #running }
AimaSearchRomaniaTest >> setUp [
	super setUp.
	graph useWeightedArcResolver.
	agent := AimaBreathFirstPathFindProgram new defaultAgent.
	problem := AimaSearchPathProblem new
		from: #Sibiu;
		to: #Bucharest;
		environment:
			(AimaRomania new
				initializeWith: graph;
				yourself)
]

{ #category : #running }
AimaSearchRomaniaTest >> testAllTheSolutionsStartAndFinishAsExpected [
	| solutions |
	problem solution: (AimaSolution upTo: 3).
	solutions := agent execute: problem.
	self assert: (solutions allSatisfy: [ : s| s root state = #Sibiu and: [ s state = #Bucharest ] ]).
	self assert: solutions size = 3
]

{ #category : #running }
AimaSearchRomaniaTest >> testThereAreSevenPathsMaximumPaths [
	| solutions |
	problem solution: AimaSolution all.
	solutions := agent execute: problem.
	self assert: solutions size = 7
]

{ #category : #running }
AimaSearchRomaniaTest >> testThereIsOnlyOnePathForOneSolutionStrategy [
	| solutions |
	problem solution: AimaSolution single.
	solutions := agent execute: problem.
	self assert: solutions size = 1
]
