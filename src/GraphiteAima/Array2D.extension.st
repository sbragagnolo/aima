Extension { #name : #Array2D }

{ #category : #'*GraphiteAima' }
Array2D >> allDiagonalsDo: aBlock [
	| i j |
	self assert: self rowCount = self columnCount .
	
	1 to: self rowCount do: [ : base | 
		
	i := 1.
	j := base.
	[ (i between: 1 and: self rowCount)
		and: [ j between: 1 and: self columnCount ] ]
		whileTrue: [ aBlock value: 1 @ base value: (self at: i at: j).
			i := i + 1.
			j := j + 1 ].
	
	i := base.
	j := 1.
	i = j ifFalse: [
	[ (i between: 1 and: self rowCount)
		and: [ j between: 1 and: self columnCount ] ]
		whileTrue: [ aBlock value: base @ 1 value: (self at: i at: j).
			i := i + 1.
			j := j + 1 ].
	].
	
	i := 1.
	j := base.

	[ (i between: 1 and: self rowCount)
		and: [ j between: 1 and: self columnCount ] ]
		whileTrue: [ aBlock value: i @ j value: (self at: i at: j).
			i := i + 1.
			j := j - 1 ].
	]
]

{ #category : #'*GraphiteAima' }
Array2D >> diagonals [
	| i j selected diagonal |
	self assert: self rowCount = self columnCount.
	selected := Dictionary new.
	1 to: self rowCount do: [ :base | 
		i := 1.
		j := base.
		diagonal := OrderedCollection new.
		[ (i between: 1 and: self rowCount)
			and: [ j between: 1 and: self columnCount ] ]
			whileTrue: [ diagonal add: (self at: i at: j).
				i := i + 1.
				j := j + 1 ].
		selected
			at:
				{(1 @ base).
				((i @ j) -1 )}
			put: diagonal.
		diagonal := OrderedCollection new.
		i := base.
		j := 1.
		i = j
			ifFalse: [ [ (i between: 1 and: self rowCount)
					and: [ j between: 1 and: self columnCount ] ]
					whileTrue: [ diagonal add: (self at: i at: j).
						i := i + 1.
						j := j + 1 ] .
			selected
			at:
				{(base @ 1).
				((i @ j) -1 )}
			put: diagonal.		
			].
		
		diagonal := OrderedCollection new.
		i := 1.
		j := base.
		[ (i between: 1 and: self rowCount)
			and: [ j between: 1 and: self columnCount ] ]
			whileTrue: [ diagonal add: (self at: i at: j).
				i := i + 1.
				j := j - 1 ].
		selected
			at:
				{(1 @ base).
				((i -1) @( j+1))}
			put: diagonal.
				
		diagonal := OrderedCollection new.
		
		i := 2.
		j := base.
		[ (i between: 2 and: self rowCount)
			and: [ j between: 2 and: self columnCount ] ]
			whileTrue: [ diagonal add: (self at: i at: j).
				i := i + 1.
				j := j - 1 ].
		selected
			at:
				{(1 @ base).
				((i -1) @( j+1))}
			put: diagonal ].
			
			
			
			
			
			 
		
		
		
	^ selected
]
