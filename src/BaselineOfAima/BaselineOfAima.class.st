Class {
	#name : #BaselineOfAima,
	#superclass : #BaselineOf,
	#category : #BaselineOfAima
}

{ #category : #baselines }
BaselineOfAima >> baseline: spec [

	<baseline>
	spec
		baseline: #Graphite
		with: [ spec repository: 'github://sbragagnolo/Graphite' ].
	spec package: #GraphiteAima with: [ spec requires: #Graphite ].

	spec group: #minimum with: #( #GraphiteAima )
]
