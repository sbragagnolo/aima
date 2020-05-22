"
Steps into a destination 
"
Class {
	#name : #AimaGraphStepInto,
	#superclass : #AimaAction,
	#traits : 'TEquality',
	#classTraits : 'TEquality classTrait',
	#instVars : [
		'destination'
	],
	#category : #'GraphiteAima-SearchOnGraph'
}

{ #category : #'as yet unclassified' }
AimaGraphStepInto >> destination [
	^ destination
]

{ #category : #'as yet unclassified' }
AimaGraphStepInto >> destination: aCity [ 
	destination := aCity
]
