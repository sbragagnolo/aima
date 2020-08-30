"
I am a romania builder. 
"
Class {
	#name : #AimaRomania,
	#superclass : #Object,
	#instVars : [
		'graph'
	],
	#category : #'GraphiteAima-WorldRomania'
}

{ #category : #'as yet unclassified' }
AimaRomania class >> edgesOfRomania [
	^ {#(Arad Zerind 75).
	#(Arad Timisoara 118).
	#(Arad Sibiu 140).
	#(Zerind Arad 75).
	#(Zerind Oradea 71).
	#(Oradea Zerind 71).
	#(Oradea Sibiu 151).
	#(Sibiu Arad 140).
	#(Sibiu Oradea 151).
	#(Sibiu Fagaras 99).
	#(Sibiu RimnicuVilcea 80).
	#(Timisoara Arad 118).
	#(Timisoara Lugoj 111).
	#(Lugoj Timisoara 111).
	#(Lugoj Mehadia 70).
	#(Mehadia Lugoj 70).
	#(Mehadia Drobeta 75).
	#(Drobeta Mehadia 75).
	#(Drobeta Craiova 120).
	#(RimnicuVilcea Sibiu 80).
	#(RimnicuVilcea Craiova 146).
	#(RimnicuVilcea Pitesti 97).
	#(Craiova Drobeta 120).
	#(Craiova RimnicuVilcea 146).
	#(Craiova Pitesti 138).
	#(Fagaras Sibiu 99).
	#(Fagaras Bucharest 211).
	#(Pitesti Craiova 138).
	#(Pitesti RimnicuVilcea 97).
	#(Pitesti Bucharest 101).
	#(Bucharest Pitesti 101).
	#(Bucharest Fagaras 211).
	#(Bucharest Urziceni 85).
	#(Bucharest Giurgiu 90).
	#(Giurgiu Bucharest 90).
	#(Urziceni Bucharest 85).
	#(Urziceni Vaslui 142).
	#(Urziceni Hirsova 98).
	#(Neamt Iasi 87).
	#(Iasi Neamt 87).
	#(Iasi Vaslui 92).
	#(Vaslui Iasi 92).
	#(Vaslui Urziceni 142).
	#(Hirsova Urziceni 98).
	#(Hirsova Eforie 86).
	#(Eforie Hirsova 86)}
]

{ #category : #'as yet unclassified' }
AimaRomania class >> heuristicToBucharest [
	^ {(#Arad -> 366).
	(#Bucharest -> 0).
	(#Craiova -> 160).
	(#Drobeta -> 242).
	(#Eforie -> 161).
	(#Fagaras -> 176).
	(#Giurgiu -> 77).
	(#Hirsova -> 151).
	(#Iasi -> 226).
	(#Lugoj -> 244).
	(#Mehadia -> 241).
	(#Neamt -> 234).
	(#Oradea -> 380).
	(#Pitesti -> 100).
	(#RimnicuVilcea -> 193).
	(#Sibiu -> 253).
	(#Timisoara -> 329).
	(#Urziceni -> 80).
	(#Vaslui -> 199).
	(#Zerind -> 374)} asDictionary
]

{ #category : #initialization }
AimaRomania >> addArcWeighted: aWeight node: aNode node: otherNode [
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
AimaRomania >> addEdge: anEdge [
	self
		addArcWeighted: anEdge third
		node: anEdge second
		node: anEdge first
]

{ #category : #initialization }
AimaRomania >> allDestinationsFrom: aCity [
	^ (graph neighbours: (graph referenceTo: aCity state))
		collect: [ :r | r readValueFrom: graph ]
]

{ #category : #initialization }
AimaRomania >> buildInto: aGraph [
	graph := aGraph.
	self class edgesOfRomania do: [ :e | self addEdge: e ].
	^ graph.
]

{ #category : #'as yet unclassified' }
AimaRomania >> costForGoingFrom: aCity to: anOtherCity [
	| arcs |
	arcs := graph
		arcsRelating: (graph referenceTo: aCity)
		with: (graph referenceTo: anOtherCity).
	^arcs
		ifEmpty: [ self error: 'Not way to go' ]
		ifNotEmpty: [ arcs anyOne weight ]
]

{ #category : #initialization }
AimaRomania >> heuristicFunctionFor: aNode forDestination: aDestinationNode [
	self assert: aDestinationNode = #Bucharest.
	^ self class heuristicToBucharest at: aNode
]

{ #category : #initialization }
AimaRomania >> initializeWith: aGraph [
	graph := aGraph.
	self class edgesOfRomania do: [ :e | self addEdge: e ]
]

{ #category : #'as yet unclassified' }
AimaRomania >> pathExistFrom: aCity to: anOtherCity [
	^ (graph neighbours: (graph referenceTo: aCity))
		includes: (graph referenceTo: anOtherCity)
]

{ #category : #initialization }
AimaRomania >> size [
	^ graph size
]
