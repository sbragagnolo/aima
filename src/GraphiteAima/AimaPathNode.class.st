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
		'state',
		'action'
	],
	#category : #'GraphiteAima-Solutions'
}

{ #category : #accessing }
AimaPathNode >> < anOtherNode [
	^ self length < anOtherNode length
]

{ #category : #accessing }
AimaPathNode >> action [
	^ action
]

{ #category : #accessing }
AimaPathNode >> action: anObject [
	action := anObject
]

{ #category : #accessing }
AimaPathNode >> length [
	^ parent ifNil: [ 1 ] ifNotNil: [ 1 + parent length ]
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

{ #category : #accessing }
AimaPathNode >> states [
	^ parent ifNil: [ {state} ] ifNotNil: [ parent states , {state} ]
]
