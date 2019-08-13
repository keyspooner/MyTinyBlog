"
Simple component to maintain the session of the the TBMBlog admin user
"
Class {
	#name : #TBMSession,
	#superclass : #WASession,
	#instVars : [
		'currentAdmin'
	],
	#category : #'MyTinyBlog-Component'
}

{ #category : #accessing }
TBMSession >> currentAdmin [
	^ currentAdmin
]

{ #category : #accessing }
TBMSession >> currentAdmin: anObject [
	currentAdmin := anObject
]

{ #category : #'as yet unclassified' }
TBMSession >> isLogged [
	^ self currentAdmin notNil
]

{ #category : #'as yet unclassified' }
TBMSession >> reset [
	currentAdmin := nil.
	self requestContext redirectTo: self application url.
	self unregister.
]
