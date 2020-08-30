"
I fetch at up to n solutions
"
Class {
	#name : #AimaSolutionUpToAmount,
	#superclass : #AimaSolutionAll,
	#instVars : [
		'amount'
	],
	#category : #'GraphiteAima-Solutions'
}

{ #category : #accessing }
AimaSolutionUpToAmount >> amount: anAmount [
	amount := anAmount 
]

{ #category : #accessing }
AimaSolutionUpToAmount >> isSolved [
	^  solution size >= amount 
]
