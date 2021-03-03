Class {
	#name : #AimaConstraintSatisfactionProgram,
	#superclass : #AimaGoalAgentProgram,
	#category : #'GraphiteAima-WorldAustralia'
}

{ #category : #'as yet unclassified' }
AimaConstraintSatisfactionProgram >> solve: anAimaConstraintsProblem [ 
	| queue current possibleValues |
	queue := OrderedCollection new. 
	queue addAll: anAimaConstraintsProblem arcs.
	possibleValues := OrderedCollection new.
	possibleValues addAll: anAimaConstraintsProblem possibleValues.
	[ queue isNotEmpty ] whileTrue: [ 
		current := queue removeFirst.
		(self revise: current problem: anAimaConstraintsProblem ) ifTrue: [
			queue addAll: (anAimaConstraintsProblem arcsTo: current).	
			possibleValues ifEmpty:[ ^ false ].
		].
	 ].
	^ true
]
