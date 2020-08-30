"
Generic problemy
"
Class {
	#name : #AimaProblem,
	#superclass : #Object,
	#instVars : [
		'environment',
		'solution'
	],
	#category : #'GraphiteAima-SearchOnGraph'
}

{ #category : #accessing }
AimaProblem >> environment [
	^ environment
]

{ #category : #accessing }
AimaProblem >> environment: anObject [
	environment := anObject
]

{ #category : #'as yet unclassified' }
AimaProblem >> isSolved [
	^ solution isSolved
]

{ #category : #accessing }
AimaProblem >> registerSolution: aProblemNode [

	self solution registerPartialSolution: aProblemNode
]

{ #category : #accessing }
AimaProblem >> size [
	^ environment size
]

{ #category : #accessing }
AimaProblem >> solution [
	^ solution 
]

{ #category : #accessing }
AimaProblem >> solution: aSolutionHolder [
	solution := aSolutionHolder
]
