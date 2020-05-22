"
I am a solution. 
I know when I am fulfilled, regarding cardinality
"
Class {
	#name : #AimaSolution,
	#superclass : #Object,
	#instVars : [
		'solution'
	],
	#category : #'GraphiteAima-Path-Solution'
}

{ #category : #'as yet unclassified' }
AimaSolution class >> all [
	^ AimaSolutionAll new
]

{ #category : #'as yet unclassified' }
AimaSolution class >> single [
	^ AimaSolution new 
]

{ #category : #'as yet unclassified' }
AimaSolution class >> upTo: anAmount [
	^ AimaSolutionUpToAmount new
		amount: anAmount;
		yourself
]

{ #category : #'as yet unclassified' }
AimaSolution >> allSatisfy: aBlock [
	^ self isSolved
		ifTrue: [ aBlock value: solution ]
		ifFalse: [ true ]
]

{ #category : #'as yet unclassified' }
AimaSolution >> isSolved [
	^ solution isNotNil
]

{ #category : #'as yet unclassified' }
AimaSolution >> printOn: aStream [
	aStream nextPutAll: 'Solutions ('.
	solution do: [ :n | n printOn: aStream ].
	aStream nextPutAll: ') '
]

{ #category : #'as yet unclassified' }
AimaSolution >> registerPartialSolution: aPartialSolution [
	solution := aPartialSolution.
]

{ #category : #'as yet unclassified' }
AimaSolution >> size [
 	^ solution ifNil: [ 0 ] ifNotNil: [ 1 ]
]
