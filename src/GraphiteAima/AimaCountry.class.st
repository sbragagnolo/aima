"
Abstract 
"
Class {
	#name : #AimaCountry,
	#superclass : #Object,
	#instVars : [
		'graph'
	],
	#category : #'GraphiteAima-WorldRomania'
}

{ #category : #accessing }
AimaCountry class >> edges [
	 ^ self subclassResponsibility 
]

{ #category : #accessing }
AimaCountry class >> example [

	^ self new
		  initializeWith: GTEAdjacencyListGraph  new;
		  yourself
]

{ #category : #initialization }
AimaCountry >> addArcNode: aNode node: otherNode [

	graph addNode: aNode.
	graph addNode: otherNode.
	graph addArc: (GTEArc new
			 nodes: { 
					 (graph referenceTo: aNode).
					 (graph referenceTo: otherNode) };
			 yourself)
]

{ #category : #initialization }
AimaCountry >> addArcWeighted: aWeight node: aNode node: otherNode [
	graph addNode: aNode.
	graph addNode: otherNode.
	graph
		addArc:
			(GTEWeightedArc new
				nodes:
					{( graph referenceTo: aNode).
					( graph referenceTo: otherNode)};
				weight: aWeight;
				yourself)
]

{ #category : #initialization }
AimaCountry >> addEdge: anEdge [
	anEdge size = 3 ifTrue: [
	self
		addArcWeighted: anEdge third
		node: anEdge second
		node: anEdge first] ifFalse: [ 
		self addArcNode: anEdge first node: anEdge second.
	 ]
]

{ #category : #initialization }
AimaCountry >> initializeWith: aGraph [
	graph := aGraph. 
	self class edges do: [ :e | self addEdge: e ].
]
