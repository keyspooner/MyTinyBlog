"
a TBBlog represents a blog that contains posts
"
Class {
	#name : #TBMBlog,
	#superclass : #Object,
	#instVars : [
		'adminUser',
		'posts',
		'title'
	],
	#category : #MyTinyBlog
}

{ #category : #'data sample' }
TBMBlog class >> createDemoPosts [
	"TBMBlog createDemoPosts"

		self current
		writeBlogPost:
			((TBMPost
				title: 'Welcome in TinyBlog'
				text: 'TinyBlog is a small blog engine made with Pharo.'
				category: 'TinyBlog') visible: true);
		writeBlogPost:
			((TBMPost
				title: 'Report Pharo Sprint'
				text:
					'Friday, June 12 there was a Pharo sprint / Moose dojo. It was a
nice event with more than 15 motivated sprinters. With the help
of candies, cakes and chocolate, huge work has been done'
				category: 'Pharo') visible: true);
		writeBlogPost:
			((TBMPost
				title:
					'Brick on top of Bloc -
Preview'
				text:
					'We are happy to announce the first preview
version of Brick, a new widget set created from scratch on top
of Bloc. Brick is being developed primarily by Alex Syrel
(together with Alain Plantec, Andrei Chis and myself), and the
work is sponsored by ESUG.
Brick is part of the Glamorous Toolkit effort and will provide
the basis for the new versions of the development tools.'
				category: 'Pharo') visible: true);
		writeBlogPost:
			((TBMPost
				title:
					'The sad story of unclassified
blog posts'
				text: 'So sad that I can read this.') visible: true);
		writeBlogPost:
			((TBMPost
				title:
					'Working with Pharo on the
Raspberry Pi'
				text:
					'Hardware is getting cheaper and many new
small devices like the famous Raspberry Pi provide new
computation power that was one once only available on regular
desktop computers.'
				category: 'Pharo') visible: true)
]

{ #category : #accessing }
TBMBlog class >> current [
	"answer the instance of the TBMRepository"
	^ self selectAll
		ifNotEmpty: [ :x | x anyOne ]
		ifEmpty: [ self new save ]
]

{ #category : #'as yet unclassified' }
TBMBlog class >> defaultAdminLogin [
	^ 'admin'
]

{ #category : #'as yet unclassified' }
TBMBlog class >> defaultAdminPassword [
	^ 'topsecret'
]

{ #category : #'class initialization' }
TBMBlog class >> initialize [
	self reset
]

{ #category : #voyage }
TBMBlog class >> initializeLocalhostMongoDB [
	| repository |
	repository := VOMongoRepository database: 'tinyblog'.
	repository enableSingleton
]

{ #category : #voyage }
TBMBlog class >> initializeVoyageOnMemoryDB [
	VOMemoryRepository new enableSingleton 
]

{ #category : #voyage }
TBMBlog class >> isVoyageRoot [
	"Indicates that instances of this class are top level document in noSQL databases"
	^ true
]

{ #category : #voyage }
TBMBlog class >> reset [
	self initializeLocalhostMongoDB 
]

{ #category : #accessing }
TBMBlog >> adminUser [
	^ adminUser
]

{ #category : #accessing }
TBMBlog >> adminUser: anObject [
	adminUser := anObject
]

{ #category : #action }
TBMBlog >> allBlogPosts [
	^ posts
]

{ #category : #action }
TBMBlog >> allBlogPostsFromCategory: aCategory [ 
	^ posts select: [ :p | p category = aCategory ]
]

{ #category : #action }
TBMBlog >> allCategories [
	^ (self allBlogPosts collect: [:p | p category]) asSet
]

{ #category : #tests }
TBMBlog >> allVisibleBlogPosts [
	^ posts select: [ :p | p isVisible ]
]

{ #category : #action }
TBMBlog >> allVisibleBlogPostsFromCategory: aCategory [ 
	^ posts select: [ :p | p category = aCategory and: [ p isVisible  ] ]
]

{ #category : #'as yet unclassified' }
TBMBlog >> createAdministrator [
	^ TBMAdministrator 
			login: self class defaultAdminLogin 
			password: self class defaultAdminPassword 
]

{ #category : #initialization }
TBMBlog >> initialize [ 
	super initialize.
	posts := OrderedCollection new.
	title := 'MyTinyBlog'.
	adminUser := self createAdministrator
	
]

{ #category : #operations }
TBMBlog >> removeAllPosts [
	posts := OrderedCollection new.
	self save.
]

{ #category : #operations }
TBMBlog >> removeBlogPost: aPost [
	posts remove: aPost ifAbsent: [ ].
	self save.
]

{ #category : #accessing }
TBMBlog >> size [
	^ posts size 
]

{ #category : #accessing }
TBMBlog >> title [
	^ title
]

{ #category : #accessing }
TBMBlog >> title: anObject [
	title := anObject
]

{ #category : #operations }
TBMBlog >> writeBlogPost: aTBMPost [ 
	"Write the blog post in database"
	self allBlogPosts add: aTBMPost.
	self save.
]
