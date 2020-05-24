"
I am a regular problem, but i do also hold an heuristic function for greedy a * problems 
"
Class {
	#name : #AimaSearchPathAStarProblem,
	#superclass : #AimaSearchPathProblem,
	#instVars : [
		'heuristicFunction'
	],
	#category : #'GraphiteAima-SearchOnGraph'
}

{ #category : #'as yet unclassified' }
AimaSearchPathAStarProblem >> heuristicCostFunction: aNode [
	^ heuristicFunction value: aNode 
]

{ #category : #'as yet unclassified' }
AimaSearchPathAStarProblem >> heuristicFunction: aFunctionOrBlock [
	^ heuristicFunction := aFunctionOrBlock
]
