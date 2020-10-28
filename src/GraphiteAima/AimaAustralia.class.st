"
Australia edges. 
"
Class {
	#name : #AimaAustralia,
	#superclass : #AimaCountry,
	#category : #'GraphiteAima-WorldAustralia'
}

{ #category : #accessing }
AimaAustralia class >> edges [

	^ { 
		  #( WesternAustralia NorthernTerritory ).
		  #( NorthernTerritory Queensland ).
		  #( Queensland NorthSouthWales ).
		  #( NorthSouthWales Victoria ).
		  #( WesternAustralia SouthAustralia ).
		  #( NorthernTerritory SouthAustralia ).
		  #( Queensland SouthAustralia ).
		  #( NorthSouthWales SouthAustralia ).
		  #( Victoria SouthAustralia ).
		  #( WesternAustralia NoneColor ).
		  #( NorthernTerritory NoneColor ).
		  #( Queensland NoneColor ).
		  #( NorthSouthWales NoneColor ).
		  #( Victoria NoneColor ) }
]
