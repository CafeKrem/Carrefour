Class {
	#name : #CRFRemoveReferencesTestTest,
	#superclass : #CRFRemoveBindingTest,
	#category : #'Carrefour-RemoveBinding-Tests'
}

{ #category : #running }
CRFRemoveReferencesTestTest >> famixTestMethod [
	^ (self famixModel allMethods select: [ :method | method name = 'test' ]) first
]

{ #category : #running }
CRFRemoveReferencesTestTest >> fastTestMethod [
	^ (self fastModel allFASTJavaMethodEntity select: [ :method | method name = 'test' ]) first
]

{ #category : #running }
CRFRemoveReferencesTestTest >> setUp [
	super setUp.
	fastModel := (JavaSmaCCProgramNodeImporterVisitor new parseCodeMethodString: self fastMethodTestString)
		name: #fastModel;
		yourself.
	CRFBinderVisitor bindFastModel: self fastModel fromFamixMethodEntity: (self famixModel allModelMethods select: [ :method | method name = 'test' ]) first.
]

{ #category : #running }
CRFRemoveReferencesTestTest >> testFromFASTRemoveInvocationsBinding [
	self fastTestMethod removeBinding.
	self assert: self famixTestMethod queryAllOutgoingInvocations size equals: 8.
	self famixTestMethod queryAllOutgoingInvocations do: [ :invocation | 
		self assert: invocation fast equals: nil ].
]

{ #category : #running }
CRFRemoveReferencesTestTest >> testFromFASTRemoveMethodBinding [
	self fastTestMethod removeBinding.
	self assert: self fastTestMethod famix equals: nil.
	self assert: self famixTestMethod fast equals: nil
]

{ #category : #running }
CRFRemoveReferencesTestTest >> testFromFASTRemoveStructuralEntityBinding [
	| structuralEntities |
	structuralEntities := (self famixModel allWithSubTypesOf: FAMIXStructuralEntity).
	"we check the value at the beginning to avoid breaking the tests"
	self assert: (structuralEntities flatCollect: #fastDeclaration) size equals: 2.
	self assert: (structuralEntities flatCollect: #fastAccesses) size equals: 14.
	self assert: (structuralEntities flatCollect: #fastAssignement) size equals: 2.
	self fastTestMethod removeBinding.
	self assert: (structuralEntities flatCollect: #fastAccesses) size equals: 0.
	self assert: (structuralEntities flatCollect: #fastDeclaration) size equals: 0.
	self assert: (structuralEntities flatCollect: #fastAssignement) size equals: 0.
]

{ #category : #running }
CRFRemoveReferencesTestTest >> testFromFASTRemoveTypeBinding [
	self assert: (self famixModel allTypes flatCollect: #fastDeclaration) size equals: 2.
	self assert: (self famixModel allTypes flatCollect: #fastAccesses) size equals: 2.
	self fastTestMethod removeBinding.
	self assert: (self famixModel allTypes flatCollect: #fastAccesses) size equals: 0.
	self assert: (self famixModel allTypes flatCollect: #fastDeclaration) size equals: 0.
]