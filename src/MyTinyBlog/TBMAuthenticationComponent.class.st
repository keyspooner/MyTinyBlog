"
TBCategoriesComponent is responsible  for authentication of a user .
"
Class {
	#name : #TBMAuthenticationComponent,
	#superclass : #WAComponent,
	#instVars : [
		'password',
		'account',
		'component'
	],
	#category : #MyTinyBlog
}

{ #category : #initialize }
TBMAuthenticationComponent class >> from: aComponent [
	^ self new component: aComponent;
	yourself
]

{ #category : #accessing }
TBMAuthenticationComponent >> account [
	^ account
]

{ #category : #accessing }
TBMAuthenticationComponent >> account: anObject [
	account := anObject
]

{ #category : #accessing }
TBMAuthenticationComponent >> component [
	^ component
]

{ #category : #accessing }
TBMAuthenticationComponent >> component: anObject [
	component := anObject
]

{ #category : #accessing }
TBMAuthenticationComponent >> password [
	^ password
]

{ #category : #accessing }
TBMAuthenticationComponent >> password: anObject [
	password := anObject
]

{ #category : #rendering }
TBMAuthenticationComponent >> renderAccountFieldOn: html [
	html 
		tbsFormGroup: [ html label with: 'Account'.
			html textInput 
			tbsFormControl;
			attributeAt: 'autofocus' put: 'true';
			callback: [ :value | account := value ];
			value: account ]
]

{ #category : #rendering }
TBMAuthenticationComponent >> renderBodyOn: html [
	html
		tbsModalBody: [
			html tbsForm: [ 
				self renderAccountFieldOn: html.
				self renderPasswordFieldOn: html.
				html tbsModalFooter: [ self renderButtonsOn: html ]] ]
]

{ #category : #rendering }
TBMAuthenticationComponent >> renderButtonsOn: html [
	html tbsButton 
		attributeAt: 'type' put: 'button';
		attributeAt: 'data-dismiss' put: 'modal';
		beDefault;
		value: 'Cancel'.
	html tbsSubmitButton 
		bePrimary;
		callback: [ self validate ];
		value: 'SignIn'
]

{ #category : #rendering }
TBMAuthenticationComponent >> renderContentOn: html [
	html tbsModal 
		id: 'myAuthDialog';
		with: [ html tbsModalDialog: [ 
						html tbsModalContent: [ 
							 self renderHeaderOn: html.
							 self renderBodyOn: html]]]
]

{ #category : #rendering }
TBMAuthenticationComponent >> renderHeaderOn: html [
	html 
		tbsModalHeader: [ 
			html tbsModalCloseIcon.
			html tbsModalTitle 
				level: 4;
				with: 'Authentication' ]
]

{ #category : #rendering }
TBMAuthenticationComponent >> renderOkCancelOn: html [
	html tbsButton 
      attributeAt: 'type' put: 'button';
      attributeAt: 'data-dismiss' put: 'modal';
      beDefault;
      value: 'Cancel2'.
	html tbsSubmitButton 
		bePrimary ;
		callback: [ self validate ];
		value: 'SignIn'
	
]

{ #category : #rendering }
TBMAuthenticationComponent >> renderPasswordFieldOn: html [
	html 
		tbsFormGroup: [ html label with: 'Password'.
			html passwordInput 
			tbsFormControl;
			callback: [ :value | password := value ];
			value: password ]
]

{ #category : #rendering }
TBMAuthenticationComponent >> validate [
	^ component tryConnectionWithLogin: self account andPassword: self password
]
