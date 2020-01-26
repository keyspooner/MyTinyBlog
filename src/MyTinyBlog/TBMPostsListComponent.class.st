"
I'm responsible for displaying a list of posts. I delegare to the post component the display of a single post.
I'm in the contact with a category component. 
"
Class {
	#name : #TBMPostsListComponent,
	#superclass : #TBMScreenComponent,
	#instVars : [
		'currentCategory',
		'showLoginError'
	],
	#category : #MyTinyBlog
}

{ #category : #'as yet unclassified' }
TBMPostsListComponent >> basicRenderCategoriesOn: html [
	html
		render: self categoriesComponent
]

{ #category : #'as yet unclassified' }
TBMPostsListComponent >> basicRenderPostsOn: html [
 ^ self readSelectedPosts do: [ :p | html render: (self postComponentFor: p)] 
]

{ #category : #'as yet unclassified' }
TBMPostsListComponent >> categoriesComponent [
	^ TBMCategoriesComponent categories: self blog allCategories postsList: self
]

{ #category : #accessing }
TBMPostsListComponent >> currentCategory [
	^ currentCategory
]

{ #category : #accessing }
TBMPostsListComponent >> currentCategory: anObject [
	currentCategory := anObject
]

{ #category : #'as yet unclassified' }
TBMPostsListComponent >> goToAdministrationView [
	self call: TBMAdminComponent new
]

{ #category : #'as yet unclassified' }
TBMPostsListComponent >> hasLoginError [
	^ showLoginError ifNil: [ false ]
]

{ #category : #'as yet unclassified' }
TBMPostsListComponent >> informUser [
	self inform: 'oops'
]

{ #category : #'as yet unclassified' }
TBMPostsListComponent >> loginErrorMessage [
	^ 'Incorrect login and/or password'
]

{ #category : #'as yet unclassified' }
TBMPostsListComponent >> loginErrorOccurred [
	showLoginError := true
]

{ #category : #'as yet unclassified' }
TBMPostsListComponent >> postComponentFor: aPost [
	^ TBMPostComponent new post: aPost
]

{ #category : #'as yet unclassified' }
TBMPostsListComponent >> readSelectedPosts [
	^ self currentCategory 
		ifNil: [ self blog allVisibleBlogPosts  ]
		ifNotNil: [ self blog allVisibleBlogPostsFromCategory: self currentCategory ]
]

{ #category : #'as yet unclassified' }
TBMPostsListComponent >> renderCategoryColumnOn: html [
	html tbsColumn
		extraSmallSize: 12;
		smallSize: 2;
		mediumSize: 4;
		with: [ self basicRenderCategoriesOn: html]
]

{ #category : #'as yet unclassified' }
TBMPostsListComponent >> renderContentOn: html [
	super renderContentOn: html.
	html
		tbsContainer: [ html tbsRow
				showGrid;
				with: [ self renderCategoryColumnOn: html.
						self renderPostColumnOn: html ] ]
]

{ #category : #'as yet unclassified' }
TBMPostsListComponent >> renderLoginErrorMessageIfAnyOn: html [ 
	self hasLoginError ifTrue: [ 
		showLoginError := false.
		html tbsAlert beDanger;
		with: self loginErrorMessage  ]
]

{ #category : #'as yet unclassified' }
TBMPostsListComponent >> renderPostColumnOn: html [
	html tbsColumn
		extraSmallSize: 12;
		smallSize: 10;
		mediumSize: 8;
		with:
				[ self renderLoginErrorMessageIfAnyOn: html.
				self basicRenderPostsOn: html]
]

{ #category : #'as yet unclassified' }
TBMPostsListComponent >> renderSignInOn: html [
	html tbsGlyphIcon perform: #iconLock.
	html html: '<a data-toggle="modal" href="#myAuthDialog"
		class="link">SignIn</a>'.
]

{ #category : #'as yet unclassified ' }
TBMPostsListComponent >> tryConnectionWithLogin: login andPassword: password [ 
	(login = self blog adminUser login and: [(SHA256 hashMessage: password) = self blog adminUser password asByteArray])
		ifTrue: [ 
			self session currentAdmin: self blog adminUser.
			self goToAdministrationView  ]
		ifFalse: [ self loginErrorOccurred ]
]
