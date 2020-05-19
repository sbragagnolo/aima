"
It just get what ever is for perceiveing in the environment for the given agent . No modification 
"
Class {
	#name : #AimaIdentitySensor,
	#superclass : #AimaSensor,
	#category : #'GraphiteAima-Core'
}

{ #category : #'as yet unclassified' }
AimaIdentitySensor >> perceive: anEnvironment for: anAgent [
	^{ anEnvironment perceptionFor: anAgent}
]
