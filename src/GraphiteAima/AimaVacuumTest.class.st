Class {
	#name : #AimaVacuumTest,
	#superclass : #TestCase,
	#instVars : [
		'agent',
		'environment'
	],
	#category : #'GraphiteAima-WorldVacuum-Test'
}

{ #category : #running }
AimaVacuumTest >> setUp [
	super setUp.
	agent := AimaVacuumProgram new defaultAgent.
	environment := AimaVacuumWorld new .
	environment agent: agent.
	
]

{ #category : #running }
AimaVacuumTest >> testCleaningActionCleans [
	AimaVacuumSuck new executeOn: environment for: agent.
	self
		assert:
			({environment left state.
			environment right state} includes: #clean)
]

{ #category : #running }
AimaVacuumTest >> testDefaultCaseIsGetsSuckMoveSuckMoveMove [
	
]

{ #category : #running }
AimaVacuumTest >> testDefaultCaseIsSolvedAfter3Executions [
	agent execute: environment. 
	self assert: ({environment left state . environment right state } includes:#clean).
	agent execute: environment. 
	self assert: ({environment left state . environment right state } includes:#dirty).
	agent execute: environment. 
	self deny: ({environment left state . environment right state } includes:#dirty).
]

{ #category : #running }
AimaVacuumTest >> testEnvironmentIsAllDirty [
	self assert: environment left state equals: #dirty.
	self assert: environment right state equals: #dirty.
]

{ #category : #running }
AimaVacuumTest >> testForCleanActionIsMove [
	self
		assert:
			(((agent agentProgram actionsFor: #clean for: agent in: environment)
				isKindOf: AimaVacuumGoLeft)
				or: [ (agent agentProgram actionsFor: #clean for: agent in: environment)
						isKindOf: AimaVacuumGoRight ])
]

{ #category : #running }
AimaVacuumTest >> testForDirtyActionIsSuck [
	self
		assert:
			((agent agentProgram actionsFor: #dirty for: agent in: environment)
				isKindOf: AimaVacuumSuck)
]

{ #category : #running }
AimaVacuumTest >> testIdentitySensorGetsDirty [
	self assert: (AimaIdentitySensor new perceive: environment for: agent) first equals: #dirty.
]
