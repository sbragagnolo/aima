Class {
	#name : #ChessAction,
	#superclass : #Object,
	#instVars : [
		'column',
		'direction'
	],
	#category : #'GraphiteAima-Chess'
}

{ #category : #'as yet unclassified' }
ChessAction class >> moveDownQueenAt: aColumn [ 
	^ self new
		column: aColumn;
		direction: #moveDown;
		yourself
]

{ #category : #'as yet unclassified' }
ChessAction class >> moveUpQueenAt: aColumn [
	^ self new
		column: aColumn;
		direction: #moveUp;
		yourself
]

{ #category : #'as yet unclassified' }
ChessAction >> applyOn: aChessBoard [
	| board |
	board := aChessBoard copy.
	direction = #moveUp
		ifTrue: [ board moveUpQueenAt: column ]
		ifFalse: [ board moveDownQueenAt: column ].
	^ board = aChessBoard
		ifTrue: [ aChessBoard ]
		ifFalse: [ board ]
]

{ #category : #'as yet unclassified' }
ChessAction >> column: anInteger [ 
	column := anInteger
]

{ #category : #'as yet unclassified' }
ChessAction >> direction: aString [ 
	direction := aString
]

{ #category : #'as yet unclassified' }
ChessAction >> moveUp: aChessBoard [
	| board |
	board := aChessBoard copy.
	board moveUpQueenAt: column.
	^ board = aChessBoard
		ifTrue: [ aChessBoard ]
		ifFalse: [ board ]
]
