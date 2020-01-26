"
I'm responsible for displaying the admin page.
"
Class {
	#name : #TBMAdminComponent,
	#superclass : #TBMScreenComponent,
	#instVars : [
		'report'
	],
	#category : #MyTinyBlog
}

{ #category : #'as yet unclassified' }
TBMAdminComponent >> children [
	^ super children copyWith: self report
]

{ #category : #'as yet unclassified' }
TBMAdminComponent >> createHeaderComponent [
	^ TBMAdminHeaderComponent from: self
]

{ #category : #'as yet unclassified' }
TBMAdminComponent >> goToPostListView [
	self answer 
]

{ #category : #'as yet unclassified' }
TBMAdminComponent >> initialize [
	super initialize.
	self report: (TBMPostsReport from: self blog)
]

{ #category : #'as yet unclassified' }
TBMAdminComponent >> renderContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [ 
		html heading: 'Blog Admin'.
		html horizontalRule.
		html render: self report]
]

{ #category : #accessing }
TBMAdminComponent >> report [
	^ report
]

{ #category : #accessing }
TBMAdminComponent >> report: aReport [
	report := aReport
]
