Class {
	#name : #CRFBindingCleaner,
	#superclass : #FASTJavaVisitor,
	#category : #'Carrefour-RemoveBinding'
}

{ #category : #generated }
CRFBindingCleaner >> fullClean: anEntity [

	"remove this entity, the top entities, all the FAST model"

	| mooseModel |
	mooseModel := anEntity mooseModel.
	mooseModel flushPrivateState.
	mooseModel flush.
	self accept: anEntity.
	mooseModel removeAll
]

{ #category : #generated }
CRFBindingCleaner >> visitFASTJavaAssignementExpression: aFASTJavaAssignementExpression [
	aFASTJavaAssignementExpression famixVariable: nil.
	^ super visitFASTJavaAssignementExpression: aFASTJavaAssignementExpression
]

{ #category : #generated }
CRFBindingCleaner >> visitFASTJavaFieldAccess: aFASTJavaFieldAccess [
	aFASTJavaFieldAccess famixVariable: nil.
	^ super visitFASTJavaFieldAccess: aFASTJavaFieldAccess
]

{ #category : #generated }
CRFBindingCleaner >> visitFASTJavaInitializer: aFASTJavaInitializer [
	aFASTJavaInitializer famix: nil.
	^ super visitFASTVariableExpression: aFASTJavaInitializer
]

{ #category : #generated }
CRFBindingCleaner >> visitFASTJavaMethodEntity: aFASTJavaMethodEntity [
	aFASTJavaMethodEntity famix: nil.
	^ super visitFASTJavaMethodEntity: aFASTJavaMethodEntity
]

{ #category : #generated }
CRFBindingCleaner >> visitFASTJavaMethodInvocation: aFASTJavaMethodInvocation [
	aFASTJavaMethodInvocation famix: nil.
	^ super visitFASTJavaMethodInvocation: aFASTJavaMethodInvocation
]

{ #category : #generated }
CRFBindingCleaner >> visitFASTJavaNewClassExpression: aFASTJavaNewClassExpression [
	aFASTJavaNewClassExpression famixType: nil.
	^ super visitFASTJavaNewClassExpression: aFASTJavaNewClassExpression
]

{ #category : #generated }
CRFBindingCleaner >> visitFASTJavaNewExpression: aFASTJavaNewExpression [
	aFASTJavaNewExpression famix: nil.
	^ super visitFASTJavaNewExpression: aFASTJavaNewExpression
]

{ #category : #generated }
CRFBindingCleaner >> visitFASTJavaParameter: aFASTJavaParameter [
	aFASTJavaParameter famixVariable fastDeclaration remove: aFASTJavaParameter.
	aFASTJavaParameter famixVariable: nil.
	^ super visitFASTJavaMethodInvocation: aFASTJavaParameter
]

{ #category : #generated }
CRFBindingCleaner >> visitFASTJavaVariableDeclarator: aFASTJavaVariableDeclarator [
	aFASTJavaVariableDeclarator famixVariable: nil.
	^ super visitFASTJavaMethodInvocation: aFASTJavaVariableDeclarator
]

{ #category : #generated }
CRFBindingCleaner >> visitFASTVariableExpression: aFASTVariableExpression [
	aFASTVariableExpression famixVariable: nil.
	^ super visitFASTVariableExpression: aFASTVariableExpression
]
