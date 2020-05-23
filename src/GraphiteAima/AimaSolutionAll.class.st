"
I wait for everything! 
"
Class {
	#name : #AimaSolutionAll,
	#superclass : #AimaSolution,
	#category : #'GraphiteAima-Path-Solution'
}

{ #category : #initialization }
AimaSolutionAll >> initialize [
	super initialize.
	solution := OrderedCollection new
]

{ #category : #initialization }
AimaSolutionAll >> isSolved [
	" I am never solved, I only get enough when there is nothing else to process "
	^ false
]

{ #category : #initialization }
AimaSolutionAll >> registerPartialSolution: aPartialSolution [
	solution add: aPartialSolution 
]

{ #category : #initialization }
AimaSolutionAll >> size [
 	^ solution size
]

{ #category : #initialization }
AimaSolutionAll >> values [
	^ solution sort: [ :a : b | a < b ]
]
