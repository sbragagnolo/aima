"
I am a problem. I have an reason, a goal, enough information to know where i do start and where do i end. 

"
Class {
	#name : #AimaSearchPathProblem,
	#superclass : #AimaProblem,
	#instVars : [
		'from',
		'to'
	],
	#category : #'GraphiteAima-Problems'
}

{ #category : #accessing }
AimaSearchPathProblem >> actionCost: action to: aNode [
	^ environment costForGoingFrom: aNode to: action destination
]

{ #category : #'as yet unclassified' }
AimaSearchPathProblem >> actionsFor: aCity [ 
	^ (environment allDestinationsFrom: aCity)
		collect: [ :d | 
			AimaGraphStepInto new
				destination: d;
				yourself ]
]

{ #category : #'as yet unclassified' }
AimaSearchPathProblem >> apply: anAimaGraphStepInto to: aNode [ 
	self assert: (anAimaGraphStepInto isKindOf: AimaGraphStepInto ).
	self assert: (environment pathExistFrom: aNode to: anAimaGraphStepInto destination). 
	^ anAimaGraphStepInto destination 
	
]

{ #category : #accessing }
AimaSearchPathProblem >> from [
	^ from
]

{ #category : #accessing }
AimaSearchPathProblem >> from: anObject [
	from := anObject
]

{ #category : #'as yet unclassified' }
AimaSearchPathProblem >> heuristicCostFunction: anEnvironmentNode [
	^ self environment heuristicFunctionFor: anEnvironmentNode forDestination: to
]

{ #category : #accessing }
AimaSearchPathProblem >> initialState [
	^ from
]

{ #category : #accessing }
AimaSearchPathProblem >> isSolution: aNode [ 
	^ to = aNode
]

{ #category : #accessing }
AimaSearchPathProblem >> to [
	^ to
]

{ #category : #accessing }
AimaSearchPathProblem >> to: anObject [
	to := anObject
]
