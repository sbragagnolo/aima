"
I fetch at up to n solutions
"
Class {
	#name : #AimaSolutionUpToAmount,
	#superclass : #AimaSolutionAll,
	#instVars : [
		'amount'
	],
	#category : #'GraphiteAima-Path-Solution'
}

{ #category : #accessing }
AimaSolutionUpToAmount >> amount: anAmount [
	amount := anAmount 
]

{ #category : #accessing }
AimaSolutionUpToAmount >> isSolved [
	^  solution size >= amount 
]
