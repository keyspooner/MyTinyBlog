"
I'm a simple component to manage a header associated to the TBMComponent
"
Class {
	#name : #TBMHeaderComponent,
	#superclass : #WAComponent,
	#instVars : [
		'component'
	],
	#category : #'MyTinyBlog-Component'
}

{ #category : #'as yet unclassified' }
TBMHeaderComponent class >> from: aComponent [
	^ self new 
	component: aComponent;
	yourself
]

{ #category : #'as yet unclassified' }
TBMHeaderComponent >> component [
	^ component
]

{ #category : #'as yet unclassified' }
TBMHeaderComponent >> component: aComponent [
	component := aComponent
]

{ #category : #'as yet unclassified' }
TBMHeaderComponent >> renderBrandOn: html [
	html tbsNavbarHeader: [ 
		html tbsNavbarBrand 
			url: self application url;
			with: 'MyTinyBlog' ]
]

{ #category : #'as yet unclassified' }
TBMHeaderComponent >> renderButtonsOn: html [
	self session isLogged
		ifTrue: [ self renderSimpleAdminButton: html ]
		ifFalse: [ self renderModalLoginButtonOn: html ]
	
]

{ #category : #'as yet unclassified' }
TBMHeaderComponent >> renderContentOn: html [
	html tbsNavbar beDefault; with: [  
		html tbsContainer: [ 
			self renderBrandOn: html.
			self renderButtonsOn: html ]]
]

{ #category : #'as yet unclassified' }
TBMHeaderComponent >> renderModalLoginButtonOn: html [
	html render: (TBMAuthenticationComponent from: component).
	html tbsNavbarButton
	tbsPullRight;
	attributeAt: 'data-target' put: '#myAuthDialog';
	attributeAt: 'data-toggle' put: 'modal';
	with: [ 
		html tbsGlyphIcon iconLock.
		html text: ' Login' ]
]

{ #category : #'as yet unclassified' }
TBMHeaderComponent >> renderSimpleAdminButton: html [
	html form: [ 
		html tbsNavbarButton tbsPullRight; 
			callback: [ component goToAdministrationView  ];
			with: [ 
				html tbsGlyphIcon iconListAlt.
				html text: ' Admin View' ] ]
]
