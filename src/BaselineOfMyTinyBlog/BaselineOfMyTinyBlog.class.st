Class {
	#name : #BaselineOfMyTinyBlog,
	#superclass : #BaselineOf,
	#category : #BaselineOfMyTinyBlog
}

{ #category : #baselines }
BaselineOfMyTinyBlog >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ "Packages"
			spec
				package: 'MyTinyBlog';
				package: 'MyTinyBlog-Component' with: [ spec requires: #('Counter') ];
				package: 'MyTinyBlog-Tests' with: [ spec requires: #('Counter') ] ]
]
