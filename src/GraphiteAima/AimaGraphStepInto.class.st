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
	#category : #'GraphiteAima-Search'
}

{ #category : #'as yet unclassified' }
AimaGraphStepInto >> destination [
	^ destination
]

{ #category : #'as yet unclassified' }
AimaGraphStepInto >> destination: aCity [ 
	destination := aCity
]

{ #category : #'as yet unclassified' }
AimaGraphStepInto >> printOn: aStream [
	aStream
		nextPutAll: 'Go: ';
		nextPutAll: destination asString
]
