"
I have the f value (should rename when better understood)
"
Class {
	#name : #AimaPathAStarNode,
	#superclass : #AimaPathCostNode,
	#traits : 'TEquality',
	#classTraits : 'TEquality classTrait',
	#instVars : [
		'f'
	],
	#category : #'GraphiteAima-Solutions'
}

{ #category : #comparing }
AimaPathAStarNode >> f [
 ^ f
]

{ #category : #comparing }
AimaPathAStarNode >> f: aValue [
	f := aValue
]

{ #category : #comparing }
AimaPathAStarNode >> printOn: aStream [
	aStream nextPutAll: '(f: '; nextPutAll: f asString; nextPutAll: 'c: '; nextPutAll: cost asString; nextPutAll: ')'.
	parent
		ifNotNil: [ parent printOn: aStream.
			aStream nextPutAll: '=>' ].
	aStream nextPutAll: state asString.
]
