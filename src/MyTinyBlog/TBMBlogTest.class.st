Class {
	#name : #TBMBlogTest,
	#superclass : #TestCase,
	#instVars : [
		'blog',
		'post',
		'first'
	],
	#category : #MyTinyBlog
}

{ #category : #running }
TBMBlogTest >> setUp [
	blog := TBMBlog current.
	blog removeAllPosts.
	
	first := TBMPost title: 'A title' text: 'A text' category: 'First Category'.
	blog writeBlogPost: first.
	
	post := (TBMPost title: 'Another title' text: 'Another text' category:  'Second Category') beVisible 
]

{ #category : #running }
TBMBlogTest >> tearDown [
	TBMBlog reset
]

{ #category : #tests }
TBMBlogTest >> testAddBlogPost [
	blog writeBlogPost: post.
	self assert: blog size equals: 2
]

{ #category : #tests }
TBMBlogTest >> testAllBlogPosts [
	blog writeBlogPost: post.
	self assert: blog allBlogPosts size equals: 2
]

{ #category : #tests }
TBMBlogTest >> testAllBlogPostsFromCategory [
	self assert: (blog allBlogPostsFromCategory: 'First Category') size equals: 1
]

{ #category : #tests }
TBMBlogTest >> testAllCategories [
	blog writeBlogPost: post.
	self assert: blog allCategories size equals: 2
]

{ #category : #tests }
TBMBlogTest >> testAllVisibleBlogPosts [
	blog writeBlogPost: post.
	self assert: blog allVisibleBlogPosts size equals: 1
]

{ #category : #tests }
TBMBlogTest >> testAllVisibleBlogPostsFromCategory [
	blog writeBlogPost: post.
	self assert: (blog allVisibleBlogPostsFromCategory: 'First Category') size equals: 0.
	self assert: (blog allVisibleBlogPostsFromCategory: 'Second Category') size equals: 1. 
]

{ #category : #tests }
TBMBlogTest >> testRemoveAllBlogPosts [
	blog removeAllPosts.
	self assert: blog size equals: 0
]

{ #category : #tests }
TBMBlogTest >> testRemoveBlogPost [
	self assert: blog size equals: 1.
	blog removeBlogPost: blog allBlogPosts anyOne.
	self assert: blog size equals: 0
]

{ #category : #tests }
TBMBlogTest >> testSize [
	self assert: blog size equals: 1
]

{ #category : #tests }
TBMBlogTest >> testUnclassifiedBlogPosts [
	self assert: (blog allBlogPosts select: [:p | p isUnclassified ]) size equals: 0
]
