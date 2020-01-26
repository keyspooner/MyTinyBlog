"
TBCategoriesComponent is responsible to display the list of all categories available in the database (the model) and also to select one category. This component should be able to communicate with the TBPostsListComponent to pass it the currently selected category.
"
Class {
	#name : #TBMCategoriesComponent,
	#superclass : #WAComponent,
	#instVars : [
		'categories',
		'postsList'
	],
	#category : #MyTinyBlog
}

{ #category : #'instance creation' }
TBMCategoriesComponent class >> categories: aCollectionOfCategories postsList: aTBMScreen [
	^ self new categories: aCollectionOfCategories; postsList: aTBMScreen
]

{ #category : #accessing }
TBMCategoriesComponent >> categories [
	^ categories
]

{ #category : #accessing }
TBMCategoriesComponent >> categories: aCollection [
	categories := aCollection asSortedCollection.
	categories add: 'All'
]

{ #category : #accessing }
TBMCategoriesComponent >> postsList [
	^ postsList 
]

{ #category : #accessing }
TBMCategoriesComponent >> postsList: aComponent [
	postsList := aComponent
]

{ #category : #rendering }
TBMCategoriesComponent >> renderCategoryLinkOn: html with: aCategory [
	html tbsLinkifyListGroupItem 
		class: 'active' if: aCategory = self postsList currentCategory;
		callback: [ self selectCategory: aCategory ];
		with: aCategory
]

{ #category : #rendering }
TBMCategoriesComponent >> renderContentOn: html [
	html tbsListGroup: [ 
		html tbsListGroupItem with: [ 
			html strong: 'Categories' ].
		 categories do: [ :cat | self renderCategoryLinkOn: html with: cat] ] 
]

{ #category : #action }
TBMCategoriesComponent >> selectCategory: aCategory [
	aCategory = 'All'
	ifTrue: [ postsList currentCategory: nil ]
	ifFalse: [postsList currentCategory: aCategory]
]
