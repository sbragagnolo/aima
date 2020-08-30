"
Vavuum program .
"
Class {
	#name : #AimaVacuumProgram,
	#superclass : #AimaReflexAgentProgram,
	#category : #'GraphiteAima-WorldVacuum'
}

{ #category : #'as yet unclassified' }
AimaVacuumProgram >> actionsFor: perception for: anAgent in: anEnvironment [
	^ self
		ifDirty: perception
		then: [ self suck ]
		else: [ self
				agentIsOnLeftSide: (anEnvironment whereIsTheAgent: anAgent)
				then: [ self goRight ]
				else: [ self goLeft ] ]
]

{ #category : #'as yet unclassified' }
AimaVacuumProgram >> agentIsOnLeftSide: where then: aBlock else: anOtherBlock [
	^ where = #left
		ifTrue: [ aBlock value ]
		ifFalse: [ anOtherBlock value ]
]

{ #category : #'as yet unclassified' }
AimaVacuumProgram >> goLeft [
	^ AimaVacuumGoLeft new 
]

{ #category : #'as yet unclassified' }
AimaVacuumProgram >> goRight [
	^ AimaVacuumGoRight new 
]

{ #category : #'as yet unclassified' }
AimaVacuumProgram >> ifDirty: perception then: aBlock else: aBlock2 [
	^ perception = #dirty
		ifTrue: [ aBlock value ]
		ifFalse: [ aBlock2 value ]
]

{ #category : #'as yet unclassified' }
AimaVacuumProgram >> suck [
	^ AimaVacuumSuck new
]
