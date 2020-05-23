"
I am a path solution that minds the cost. I am aware of the weights in the arrows of the graph. 
"
Class {
	#name : #AimaUniformCostBreathFirstPathFindProgram,
	#superclass : #AimaAbstractBreathFirstPathFindProgram,
	#category : #'GraphiteAima-SearchOnGraph'
}

{ #category : #'as yet unclassified' }
AimaUniformCostBreathFirstPathFindProgram >> childNode: problem parent: parent action: action [
	^ AimaPathCostNode new
		state: (problem apply: action to: parent state);
		parent: parent;
		action: action;
		cost: parent cost + (problem actionCost: action to: parent state);
		yourself
]

{ #category : #'as yet unclassified' }
AimaUniformCostBreathFirstPathFindProgram >> initialNode: node [
	^ AimaPathCostNode new
		state: node;
		parent: nil;
		action: AimaActionEmpty new;
		cost: 0; 
		yourself
]

{ #category : #'as yet unclassified' }
AimaUniformCostBreathFirstPathFindProgram >> registerNewFrontier: child [
	(explored includes: child state)
		ifTrue: [ ^ self ].
		
		" For minimizing the cost, we look on the existing frontiers. 
		If the frontier includes an other path that goes through the same state of the graph, 
		then we compare costs and replace one child by the new one if is the thing to do "
	frontier
		detect: [ :f | f state = child state ]
		ifFound: [ :current | 
			current cost > child cost ifTrue: [ 
				frontier replaceAll: current with: child 
			] 
		] ifNone: [ 
			frontier add: child 
		]
]
