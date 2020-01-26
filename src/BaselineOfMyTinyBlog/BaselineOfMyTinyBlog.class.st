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
		do: [
			self bootstrapMagritte: spec.
			self voyage: spec.
			self seaside: spec.
			spec
				package: 'MyTinyBlog'
				with: [ spec requires: #('BootstrapMagritte' 'Voyage' 'Seaside3') ] ]
]

{ #category : #baselines }
BaselineOfMyTinyBlog >> bootstrapMagritte: spec [
spec
	project: 'BootstrapMagritte'
	with: [ spec
		className: #ConfigurationOfBootstrapMagritte;
		versionString: #'stable';
		repository: 'http://smalltalkhub.com/mc/TorstenBergmann/BootstrapMagritte/main/' ]
]

{ #category : #baselines }
BaselineOfMyTinyBlog >> seaside: spec [
	spec 
		baseline: 'Seaside3'
		with: [ spec 
						repository: 'github://SeasideSt/Seaside:master/repository' ]
]

{ #category : #baselines }
BaselineOfMyTinyBlog >> voyage: spec [
	spec 
		baseline: 'Voyage'
		with: [ 
			spec
			loads: #('mongo tests' 'memory tests');
			repository: 'github://pharo-nosql/voyage/mc' ]
]
