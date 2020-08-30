Class {
	#name : #AimaStimulatedHillClimbingPathFindProgram,
	#superclass : #AimaHillClimbingPathFindProgram,
	#instVars : [
		'probability',
		'random'
	],
	#category : #'GraphiteAima-SearchOnGraph'
}

{ #category : #'as yet unclassified' }
AimaStimulatedHillClimbingPathFindProgram >> chooseNextStep: neighbours knowingCurrent: current for: problem [
	
	probability > self nextRandom ifTrue: [ 
		probability := (probability - 0.02) max: 0.
		^ super chooseNextStep: neighbours knowingCurrent: current for: problem.
	].
	probability := (probability + 0.02) min: 1.0. 
	^ neighbours shuffle first: amountOfConcurrentStates . 
]

{ #category : #'as yet unclassified' }
AimaStimulatedHillClimbingPathFindProgram >> initialize [ 
	super initialize. 
	probability := 1 .
]

{ #category : #'as yet unclassified' }
AimaStimulatedHillClimbingPathFindProgram >> nextRandom [
	random ifNil: [ random := (Random seed: DateAndTime now asUnixTime asString reverse asInteger )   ].
	^ random next.
]
