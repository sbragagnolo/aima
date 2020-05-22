"
I am a path node. I look like a tree, because normally i am built as one. But the only important result i can give you, is my parent hood. therefor, only on path.
"
Class {
	#name : #AimaPathNode,
	#superclass : #Object,
	#traits : 'TEquality',
	#classTraits : 'TEquality classTrait',
	#instVars : [
		'parent',
		'cost',
		'state',
		'action'
	],
	#category : #'GraphiteAima-Path-Solution'
}

{ #category : #accessing }
AimaPathNode >> action [
	^ action
]

{ #category : #accessing }
AimaPathNode >> action: anObject [
	action := anObject
]

{ #category : #accessing }
AimaPathNode >> cost [
	^ cost
]

{ #category : #accessing }
AimaPathNode >> cost: anObject [
	cost := anObject
]

{ #category : #accessing }
AimaPathNode >> parent [
	^ parent
]

{ #category : #accessing }
AimaPathNode >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
AimaPathNode >> printOn: aStream [
	aStream nextPutAll:'$' ; nextPutAll: cost asString ; nextPutAll: ' '.
	parent ifNotNil: [ parent printOn: aStream. aStream nextPutAll:'=>' ].
	aStream nextPutAll: state asString
]

{ #category : #'as yet unclassified' }
AimaPathNode >> root [
	^ parent ifNil: [ self ] ifNotNil: [ parent root ]
]

{ #category : #accessing }
AimaPathNode >> state [
	^ state
]

{ #category : #accessing }
AimaPathNode >> state: anObject [
	state := anObject
]