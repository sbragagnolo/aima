Class {
	#name : #AimaQueensTest,
	#superclass : #GTEAbstractGraphTest,
	#instVars : [
		'problem'
	],
	#category : #'GraphiteAima-WorldChess'
}

{ #category : #running }
AimaQueensTest >> hillClimbing [
	^ AimaHillClimbingPathFindProgram new defaultAgent 
]

{ #category : #running }
AimaQueensTest >> runCaseManaged [
	^ self runCase
]

{ #category : #running }
AimaQueensTest >> setUp [
	super setUp.
	graph useWeightedArcResolver.
	problem := AimaStateSearchProblem new
		environment:
			(ChessBoard new
				randomizeQueens;
				yourself)
]

{ #category : #running }
AimaQueensTest >> testHillClimbingThereIsOnlyOneBoardForOneSolutionStrategy [
	| solutions |
	problem solution: AimaSolution single.
	solutions := self hillClimbing execute: problem.
	self assert: solutions size equals: 1
]
