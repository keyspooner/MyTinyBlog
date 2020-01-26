"
I'm a simple component to manage a header associated to the TBMAdminComponent
"
Class {
	#name : #TBMAdminHeaderComponent,
	#superclass : #TBMHeaderComponent,
	#category : #MyTinyBlog
}

{ #category : #'as yet unclassified' }
TBMAdminHeaderComponent >> renderButtonsOn: html [
	html form: [ 
		self renderDisconnectButtonOn: html.
		self renderPublicViewButtonOn: html]
]

{ #category : #'as yet unclassified' }
TBMAdminHeaderComponent >> renderDisconnectButtonOn: html [
	html tbsNavbarButton 
		tbsPullRight;
		callback: [ self session reset  ];
		with: [ 
				html text: 'Disconnect '.
				html tbsGlyphIcon iconLogout  ]
]

{ #category : #'as yet unclassified' }
TBMAdminHeaderComponent >> renderPublicViewButtonOn: html [
	self session isLogged
		ifTrue: [ 
			html tbsNavbarButton 
			tbsPullRight;
			callback: [ component goToPostListView  ];
			with: [ 
				html text: 'Public View '.
				html tbsGlyphIcon iconEyeOpen  ]]
]
