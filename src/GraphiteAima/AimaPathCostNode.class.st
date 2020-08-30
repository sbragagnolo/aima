"
I am a path that consider the cost of the actions 
"
Class {
	#name : #AimaPathCostNode,
	#superclass : #AimaPathNode,
	#traits : 'TEquality',
	#classTraits : 'TEquality classTrait',
	#instVars : [
		'cost'
	],
	#category : #'GraphiteAima-Solutions'
}

{ #category : #accessing }
AimaPathCostNode >> < anOtherNode [
	^ self cost < anOtherNode cost
]

{ #category : #accessing }
AimaPathCostNode >> cost [
	^ cost
]

{ #category : #accessing }
AimaPathCostNode >> cost: anObject [
	cost := anObject
]

{ #category : #accessing }
AimaPathCostNode >> printOn: aStream [
	aStream nextPutAll:'$' ; nextPutAll: cost asString ; nextPutAll: ' '.
	super printOn: aStream
]
