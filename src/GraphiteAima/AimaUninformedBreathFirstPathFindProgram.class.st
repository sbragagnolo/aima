"
I do look for paths without having much insight. 
"
Class {
	#name : #AimaUninformedBreathFirstPathFindProgram,
	#superclass : #AimaAbstractBreathFirstPathFindProgram,
	#category : #'GraphiteAima-SearchOnGraph'
}

{ #category : #'as yet unclassified' }
AimaUninformedBreathFirstPathFindProgram >> childNode: problem parent: parent action: action [
	^ AimaPathNode new
		state: (problem apply: action to: parent state);
		parent: parent;
		action: action;
		yourself
]

{ #category : #'as yet unclassified' }
AimaUninformedBreathFirstPathFindProgram >> initialNode: node [
	^ AimaPathNode new
		state: node;
		parent: nil;
		action: AimaActionEmpty new;
		yourself
]

{ #category : #'as yet unclassified' }
AimaUninformedBreathFirstPathFindProgram >> registerNewFrontier: child [
	((frontier includes: child) or: [ explored includes: child state ])
		ifFalse: [ frontier add: child ]
]
