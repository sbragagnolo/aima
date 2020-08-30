"
I am a chess board for  the 8 queens game problem
"
Class {
	#name : #ChessBoard,
	#superclass : #Object,
	#traits : 'TEquality',
	#classTraits : 'TEquality classTrait',
	#instVars : [
		'board'
	],
	#category : #'GraphiteAima-WorldChess'
}

{ #category : #'as yet unclassified' }
ChessBoard >> allMutationsAsActions [
	^ (1 to: 8)
		flatCollect: [ :i | 
			{(ChessAction moveUpQueenAt: i).
			(ChessAction moveDownQueenAt: i)} ]
]

{ #category : #initialization }
ChessBoard >> initialize [
	super initialize.
	board := Array2D rows: 8 columns: 8 tabulate: [ :x :y | 0 ]

]

{ #category : #'as yet unclassified' }
ChessBoard >> isSolved [
	^ self pairsOfCheckedQueens = 0
]

{ #category : #'as yet unclassified' }
ChessBoard >> moveDownQueenAt: anInteger [ 
	" Should change "

	(board atColumn: anInteger)
		withIndexDo: [ :each :index | 
			each = 1 ifTrue: [ 
					board at: index at: anInteger put: 0.
					board at: (index - 1 max: 1) at: anInteger put: 1.
					^ self
			]
	 ].
	^ self error: ' Unexpected empty column '
]

{ #category : #'as yet unclassified' }
ChessBoard >> moveUpQueenAt: anInteger [
	" Should change "

	(board atColumn: anInteger)
		withIndexDo: [ :each :index | 
			each = 1 ifTrue: [ 
					board at: index at: anInteger put: 0.
					board at: (index + 1 min: board rowCount) at: anInteger put: 1.
					^ self
			]
	 ].
	^ self error: ' Unexpected empty column '
]

{ #category : #'as yet unclassified' }
ChessBoard >> pairsOfCheckedQueens [
	| lines |
	lines := ((1 to: 8) collect: [ :i | (board atRow: i) sum - 1 max: 0 ])
		sum.
	^ lines
		+
			(board diagonals values
				collect: [ :d | d ifEmpty: [ 0 ] ifNotEmpty: [ d sum - 1 max: 0 ] ])
				sum
]

{ #category : #initialization }
ChessBoard >> postCopy [
	super postCopy.
	board := board copy
]

{ #category : #initialization }
ChessBoard >> randomizeQueens [
	| j |
	1 to: 8 do: [ :i | 
		j := 7 atRandom + 1.
		(board at: j at: i) = 0
			ifTrue: [ board at: j at: i put: 1 ] ]
]

{ #category : #'as yet unclassified' }
ChessBoard >> state [
	^ self
]
