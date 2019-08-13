"
A  TBPost is a blog post.
"
Class {
	#name : #TBMPost,
	#superclass : #Object,
	#instVars : [
		'title',
		'text',
		'date',
		'category',
		'visible'
	],
	#category : #MyTinyBlog
}

{ #category : #'as yet unclassified' }
TBMPost class >> title: aTitle text: aText [
	^ self new
		title: aTitle;
		text: aText;
		yourself.
]

{ #category : #'as yet unclassified' }
TBMPost class >> title: aTitle text: aText category: aCategory [
	^ (self title: aTitle text: aText) 
		category: aCategory;
		yourself
]

{ #category : #'as yet unclassified' }
TBMPost class >> unclassifiedTag [
	^ 'Unclassified'
]

{ #category : #operations }
TBMPost >> beVisible [
	self visible: true.
]

{ #category : #accessing }
TBMPost >> category [
	^ category
]

{ #category : #accessing }
TBMPost >> category: anObject [
	category := anObject
]

{ #category : #accessing }
TBMPost >> date [
	^ date
]

{ #category : #accessing }
TBMPost >> date: anObject [
	date := anObject
]

{ #category : #accessing }
TBMPost >> descriptionCategory [
	<magritteDescription>
	^ MAStringDescription new 
	label: 'Category';
	priority: 300;
	accessor: #category;
	comment: 'Unclassified if empty';
	componentClass: TBSMagritteTextInputComponent ;
	yourself.
]

{ #category : #accessing }
TBMPost >> descriptionContainer [
	<magritteContainer>
	^ super descriptionContainer 
		componentRenderer: TBSMagritteFormRenderer;
		yourself 
]

{ #category : #accessing }
TBMPost >> descriptionDate [
	<magritteDescription>
	^ MADateDescription  new 
	label: 'Date';
	priority: 400;
	accessor: #date;
	beRequired;
	yourself.
]

{ #category : #accessing }
TBMPost >> descriptionText [
	<magritteDescription>
	^ MAMemoDescription  new 
	label: 'Text';
	priority: 200;
	accessor: #text;
	beRequired;
	requiredErrorMessage: 'A blog post must contain a text.';
	comment: 'Please enter a text';
	componentClass: TBSMagritteTextAreaComponent ;
	yourself.
]

{ #category : #accessing }
TBMPost >> descriptionTitle [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Title';
		priority: 100;
		accessor: #title;
		requiredErrorMessage: 'A blog post must have a title.';
		comment: 'Please enter a title';
		componentClass: TBSMagritteTextInputComponent;
		beRequired;
		yourself
]

{ #category : #accessing }
TBMPost >> descriptionVisible [
	<magritteDescription>
	^ MABooleanDescription new 
	label: 'Visible';
	priority: 500;
	accessor: #visible;
	componentClass: TBSMagritteCheckboxComponent ;
	beRequired;
	yourself
]

{ #category : #initialize }
TBMPost >> initialize [
	self category: TBMPost unclassifiedTag.
	self date: Date today.
	self notVisible.
]

{ #category : #testing }
TBMPost >> isUnclassified [
	^ self category = TBMPost unclassifiedTag 
]

{ #category : #operations }
TBMPost >> isVisible [
	^ self visible
]

{ #category : #operations }
TBMPost >> notVisible [
	self visible: false.
]

{ #category : #accessing }
TBMPost >> text [
	^ text
]

{ #category : #accessing }
TBMPost >> text: anObject [
	text := anObject
]

{ #category : #accessing }
TBMPost >> title [
	^ title
]

{ #category : #accessing }
TBMPost >> title: anObject [
	title := anObject
]

{ #category : #accessing }
TBMPost >> visible [
	^ visible
]

{ #category : #accessing }
TBMPost >> visible: anObject [
	visible := anObject
]
