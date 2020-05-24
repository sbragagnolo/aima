Class {
	#name : #AimaSearchRomaniaTest,
	#superclass : #GTEAbstractGraphTest,
	#instVars : [
		'problem'
	],
	#category : #'GraphiteAima-Romania'
}

{ #category : #running }
AimaSearchRomaniaTest >> astar [
	^ AimaAStarPathFindProgram new defaultAgent
]

{ #category : #running }
AimaSearchRomaniaTest >> deepFirst [
	^ AimaDepthFirstPathFindProgram new defaultAgent
]

{ #category : #running }
AimaSearchRomaniaTest >> runCaseManaged [
	^ self runCase
]

{ #category : #running }
AimaSearchRomaniaTest >> setUp [
	super setUp.
	graph useWeightedArcResolver.
	problem := AimaSearchPathProblem new
		from: #Sibiu;
		to: #Bucharest;
		environment:
			(AimaRomania new
				initializeWith: graph;
				yourself)
]

{ #category : #running }
AimaSearchRomaniaTest >> testAStarAllTheSolutionsStartAndFinishAsExpected [
	| solutions |
	problem solution: (AimaSolution upTo: 3).
	solutions := self astar execute: problem.
	self assert: (solutions values allSatisfy: [ : s| s root state = #Sibiu and: [ s state = #Bucharest ] ]).
	self assert: solutions size equals: 3
]

{ #category : #running }
AimaSearchRomaniaTest >> testAStarFirstThereAreThreePathsMaximumPaths [
	| solutions |
	problem solution: AimaSolution all.
	solutions := self astar execute: problem.
	self assert: solutions size equals: 42
]

{ #category : #running }
AimaSearchRomaniaTest >> testAStarFirstThereIsOnlyOnePathForOneSolutionStrategy [
	| solutions |
	problem solution: AimaSolution single.
	solutions := self astar execute: problem.
	self assert: solutions size equals: 1
]

{ #category : #running }
AimaSearchRomaniaTest >> testDeepFirstThereAreThreePathsMaximumPaths [
	| solutions |
	problem solution: AimaSolution all.
	solutions := self deepFirst execute: problem.
	self assert: solutions size equals: 6
]

{ #category : #running }
AimaSearchRomaniaTest >> testDeepFirstThereIsOnlyOnePathForOneSolutionStrategy [
	| solutions |
	problem solution: AimaSolution single.
	solutions := self deepFirst execute: problem.
	self assert: solutions size equals: 1
]

{ #category : #running }
AimaSearchRomaniaTest >> testDeepfirstAllTheSolutionsStartAndFinishAsExpected [
	| solutions |
	problem solution: (AimaSolution upTo: 3).
	solutions := self deepFirst execute: problem.
	self assert: (solutions values allSatisfy: [ : s| s root state = #Sibiu and: [ s state = #Bucharest ] ]).
	self assert: solutions size equals: 3
]

{ #category : #running }
AimaSearchRomaniaTest >> testUniforCostHasOnlySolutionsWithTheSameCostWithinTheThreshold [
	| solutions |
	problem solution: (AimaSolution upTo: 1).
	solutions := self uniformCostAgent execute: problem.
	self assert: (solutions values allSatisfy: [ : s| s root state = #Sibiu and: [ s state = #Bucharest ] ]).
	self assert: solutions size equals: 1 
]

{ #category : #running }
AimaSearchRomaniaTest >> testUniformCostThereAreThreePathsMaximumPaths [
	| solutions |
	problem solution: AimaSolution all.
	solutions := self uniformCostAgent  execute: problem.
	self assert: solutions size equals: 2
]

{ #category : #running }
AimaSearchRomaniaTest >> testUniformCostThereIsOnlyOnePathForOneSolutionStrategy [
	| solutions |
	problem solution: AimaSolution single.
	solutions := self uniformCostAgent  execute: problem.
	self assert: solutions size equals: 1
]

{ #category : #running }
AimaSearchRomaniaTest >> testUninformedAllTheSolutionsStartAndFinishAsExpected [
	| solutions |
	problem solution: (AimaSolution upTo: 2).
	solutions := self uninformedAgent execute: problem.
	self assert: (solutions values allSatisfy: [ : s| s root state = #Sibiu and: [ s state = #Bucharest ] ]).
	self assert: solutions size equals: 2
]

{ #category : #running }
AimaSearchRomaniaTest >> testUninformedThereAreThreePathsMaximumPaths [
	| solutions |
	problem solution: AimaSolution all.
	solutions := self uninformedAgent execute: problem.
	self assert: solutions size equals: 3
]

{ #category : #running }
AimaSearchRomaniaTest >> testUninformedThereIsOnlyOnePathForOneSolutionStrategy [
	| solutions |
	problem solution: AimaSolution single.
	solutions := self uninformedAgent execute: problem.
	self assert: solutions size equals: 1
]

{ #category : #running }
AimaSearchRomaniaTest >> uniformCostAgent [
	^ AimaUniformCostBreathFirstPathFindProgram new defaultAgent
]

{ #category : #running }
AimaSearchRomaniaTest >> uninformedAgent [
	^ AimaUninformedBreathFirstPathFindProgram new defaultAgent
]
