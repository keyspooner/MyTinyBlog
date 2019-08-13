"
Model for administator username and password credentials
"
Class {
	#name : #TBMAdministrator,
	#superclass : #Object,
	#instVars : [
		'login',
		'password'
	],
	#category : #MyTinyBlog
}

{ #category : #'as yet unclassified' }
TBMAdministrator class >> login: login password: password [
	^ self new 
		login: login;
		password: password;
		yourself
]

{ #category : #accessing }
TBMAdministrator >> login [
	^ login
]

{ #category : #accessing }
TBMAdministrator >> login: anObject [
	login := anObject
]

{ #category : #accessing }
TBMAdministrator >> password [
	^ password
]

{ #category : #accessing }
TBMAdministrator >> password: anObject [
	password := SHA256 hashMessage: anObject 
]
