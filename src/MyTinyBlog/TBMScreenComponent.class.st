"
Abstract class for the Tiny Blog component layout. 

Root of the elements that are represented inside the application root component. 
Subclasses are 
	- the user visible components such as list of blog posts
	- the admin components
"
Class {
	#name : #TBMScreenComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header'
	],
	#category : #'MyTinyBlog-Component'
}

{ #category : #accessing }
TBMScreenComponent >> blog [
	"Return the current blog in the future we will ask the session to return the blog of the currently 	logged in user"
	^ TBMBlog current 	
]

{ #category : #accessing }
TBMScreenComponent >> children [
	^ OrderedCollection with: header
]

{ #category : #initialize }
TBMScreenComponent >> createHeaderComponent [
	^ TBMHeaderComponent from: self
]

{ #category : #initialize }
TBMScreenComponent >> initialize [
	super initialize.
	header := self createHeaderComponent 
]

{ #category : #rendering }
TBMScreenComponent >> renderContentOn: html [
	html render: header 
]
