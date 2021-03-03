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
	#category : #'GraphiteAima-Solutions'
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
AimaSolution >> isSolved [
	^ solution isNotNil
]

{ #category : #'as yet unclassified' }
AimaSolution >> printOn: aStream [

	aStream nextPutAll: 'Solutions ('.
	solution
		ifNil: [ aStream nextPutAll: 'None' ]
		ifNotNil: [ :v | v do: [ :n | n printOn: aStream ] ].
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

{ #category : #'as yet unclassified' }
AimaSolution >> values [
	^ solution ifNil: [ {} ] ifNotNil: [ {solution} ]
]
