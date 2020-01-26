Class {
	#name : #TBMPostTest,
	#superclass : #TestCase,
	#category : #MyTinyBlog
}

{ #category : #tests }
TBMPostTest >> testPostIsCreatedCorrectly [
	|post|
	post := TBMPost 
		title: 'Welcome to TinyBlog' 
		text:  'This is some text'
		category: 'TinyBlog'.
		self assert: post title equals: 'Welcome to TinyBlog'.
		self assert: post text equals: 'This is some text'
]

{ #category : #tests }
TBMPostTest >> testWithoutCategoryIsUnclassified [
	|post|
	post := TBMPost 
		title: 'Welcome to TinyBlog' 
		text:  'This is some text'.
		self assert: post title equals: 'Welcome to TinyBlog'.
		self assert: post isUnclassified.
		self deny: post isVisible.
		
]
