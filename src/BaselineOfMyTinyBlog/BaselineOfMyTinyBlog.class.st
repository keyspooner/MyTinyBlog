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
			spec
				package: 'MyTinyBlog'
				with: [ spec requires: #('BootstrapMagritte' 'Voyage') ] ]
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
BaselineOfMyTinyBlog >> projectClass [
	^ MetacelloCypressBaselineProject
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
