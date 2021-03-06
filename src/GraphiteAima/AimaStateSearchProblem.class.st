"
I am the kind of problem that looks for specific state. 
"
Class {
	#name : #AimaStateSearchProblem,
	#superclass : #AimaProblem,
	#category : #'GraphiteAima-Problems'
}

{ #category : #'as yet unclassified' }
AimaStateSearchProblem >> actionsFor: anEnvironment [  
	^ anEnvironment allMutationsAsActions 
]

{ #category : #'as yet unclassified' }
AimaStateSearchProblem >> apply: anAction to: anEnvironment [ 
	^ anAction applyOn: anEnvironment
]

{ #category : #'as yet unclassified' }
AimaStateSearchProblem >> heuristicFunctionFor: aChessBoard [ 
	^ aChessBoard pairsOfCheckedQueens
]

{ #category : #'as yet unclassified' }
AimaStateSearchProblem >> initialState [
	^ environment
]

{ #category : #'as yet unclassified' }
AimaStateSearchProblem >> isSolution: aChessBoard [ 
	^ aChessBoard isSolved 
]
