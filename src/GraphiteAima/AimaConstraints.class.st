Class {
	#name : #AimaConstraints,
	#superclass : #AimaProblem,
	#instVars : [
		'left',
		'right',
		'operator'
	],
	#category : #'GraphiteAima-WorldAustralia'
}

{ #category : #'as yet unclassified' }
AimaConstraints class >> left: aVal operator: aSymbol right: otherVal [

	^ self new
		  left: aVal;
		  right: otherVal;
		  operator: aSymbol;
		  yourself
]
