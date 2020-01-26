"
Seaside Component Root for the TinyBlog  Application.

A simple class to register the application to the Seaside application server.
I'm the entry point of the application. 

Point your browser to 
	http://localhost:8080/MyTinyBlog

If it does not work, check that the server is running

	ZnZincServerAdaptor startOn: 8080.
	
I point to my main element that is an instance of TBMScreenComponent subclasses.
"
Class {
	#name : #TBMApplicationRootComponent,
	#superclass : #WAComponent,
	#instVars : [
		'main'
	],
	#category : #'MyTinyBlog-Component'
}

{ #category : #'class initialization' }
TBMApplicationRootComponent class >> canBeRoot [
	^ true
]

{ #category : #'class initialization' }
TBMApplicationRootComponent class >> initialize [
	"self initialize"
	| app |
	app := WAAdmin register: self asApplicationAt: 'MyTinyBlog'.
	app
		preferenceAt: #sessionClass put: TBMSession.
	app
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: TBSDeploymentLibrary
]

{ #category : #rendering }
TBMApplicationRootComponent >> children [
	^ { main }
]

{ #category : #initialize }
TBMApplicationRootComponent >> initialize [
	super initialize.
	main := TBMPostsListComponent  new.
]

{ #category : #accessing }
TBMApplicationRootComponent >> main [
	^ main
]

{ #category : #accessing }
TBMApplicationRootComponent >> main: aComponent [
	main := aComponent
]

{ #category : #rendering }
TBMApplicationRootComponent >> renderContentOn: html [
	html render: main
]

{ #category : #rendering }
TBMApplicationRootComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'MyTinyBlog'
]
