"
I display a magritte report on the TBMAdminComponent
"
Class {
	#name : #TBMPostsReport,
	#superclass : #TBSMagritteReport,
	#instVars : [
		'blog'
	],
	#category : #MyTinyBlog
}

{ #category : #'as yet unclassified' }
TBMPostsReport class >> filteredDescriptionsFrom: aBlogPost [
	"filter only some descriptions for the report columns"
	^ aBlogPost magritteDescription 
		select: [ :each | #(title category date) includes: each accessor selector ]
]

{ #category : #'as yet unclassified' }
TBMPostsReport class >> from: aBlog [
	|report allBlogs|
	allBlogs := aBlog allBlogPosts.
	report := self rows: allBlogs description: (self filteredDescriptionsFrom: allBlogs anyOne).
	report blog: aBlog.
	report addColumn: (MACommandColumn new 
		addCommandOn: report selector: #viewPost: text: 'View'; yourself;
		addCommandOn: report selector: #editPost: text: 'Edit' yourself;
		addCommandOn: report selector: #deletePost: text: 'Delete' yourself).
	^ report
	
	 
]

{ #category : #'as yet unclassified' }
TBMPostsReport >> addPost [
	|post|
	post := self call: (self renderAddPostForm: TBMPost new).
	post ifNotNil: [ 
		blog writeBlogPost: post.
		self refreshReport ]
]

{ #category : #accessing }
TBMPostsReport >> blog [
	^ blog
]

{ #category : #accessing }
TBMPostsReport >> blog: aTBMBLog [
	blog := aTBMBLog
]

{ #category : #'as yet unclassified' }
TBMPostsReport >> deletePost: aPost [
	(self confirm: 'Do you want to remove this post?')
		ifTrue: [ 
			blog removeBlogPost: aPost.
			self refreshReport  ]
]

{ #category : #'as yet unclassified' }
TBMPostsReport >> editPost: aPost [
	|post|
	post := self call: (self renderEditPostForm: aPost).
	post ifNotNil: [ blog save]
]

{ #category : #'as yet unclassified' }
TBMPostsReport >> refreshReport [
	self rows: blog allBlogPosts.
	self refresh.
]

{ #category : #'as yet unclassified' }
TBMPostsReport >> renderAddPostForm: aPost [
	^ aPost asComponent 
		addDecoration: (TBSMagritteFormDecoration buttons: { #save -> 'Add Post' . #cancel -> 'Cancel'});
		yourself
]

{ #category : #'as yet unclassified' }
TBMPostsReport >> renderContentOn: html [
	html tbsGlyphIcon iconPencil.
	html anchor
		callback: [ self addPost ];
		with: 'Add Post '.
	super renderContentOn: html
]

{ #category : #'as yet unclassified' }
TBMPostsReport >> renderEditPostForm: aPost [
	^ aPost asComponent 
		addDecoration: (TBSMagritteFormDecoration buttons: { #save -> 'Save Post' . #cancel -> 'Cancel'});
		yourself
]

{ #category : #'as yet unclassified' }
TBMPostsReport >> renderViewPostForm: aPost [
	^ aPost asComponent 
		addDecoration: (TBSMagritteFormDecoration buttons: { #cancel -> 'Back'});
		readonly: true;
		yourself
]

{ #category : #'as yet unclassified' }
TBMPostsReport >> viewPost: aPost [
	self call: (self renderViewPostForm: aPost)
]
