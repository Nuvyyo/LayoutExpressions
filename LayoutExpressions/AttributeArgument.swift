//  Copyright (c) 2014 Steve Brambilla. All rights reserved.

import UIKit

// MARK: Item Attributes Argument

class AttributeArgument: DistinctLeftHandSideArgument, DistinctRightHandSideArgument {
	let _item: AnyObject
	let _attribute: NSLayoutAttribute
	let _multiplier: CGFloat?
	let _constant: CGFloat?

	init(item: AnyObject, attribute: NSLayoutAttribute, multiplier: CGFloat? = nil, constant: CGFloat? = nil) {
		_item = item
		_attribute = attribute
		_multiplier = multiplier
		_constant = constant
	}

	func updateMultiplier(multiplier: CGFloat) -> AttributeArgument {
		return AttributeArgument(item: _item, attribute: _attribute, multiplier: multiplier, constant: _constant)
	}

	func updateConstant(constant: CGFloat) -> AttributeArgument {
		return AttributeArgument(item: _item, attribute: _attribute, multiplier: _multiplier, constant: constant)
	}

	// LeftHandSideArgument
	var item: AnyObject {
		return _item
	}

	var attributes: [NSLayoutAttribute] {
		return [ self.attribute ]
	}

	// DistinctLeftHandSideArgument
	var attribute: NSLayoutAttribute {
		return _attribute
	}

	// RightHandSideArgument
	func attributeValues(leftAttribute: NSLayoutAttribute) -> (item: AnyObject?, attribute: NSLayoutAttribute, multiplier: CGFloat?, constant: CGFloat?) {
		return self.attributeValues
	}

	// DistinctRightHandSideArgument
	var attributeValues: (item: AnyObject?, attribute: NSLayoutAttribute, multiplier: CGFloat?, constant: CGFloat?) {
		return (item:_item, attribute: _attribute, multiplier: _multiplier, constant: _constant)
	}
}

// Note: Order of operations still matters if using a multiplier AND constant.
// We _could_ use additional types to prevent multiple '*' / '+' / '-' operations...

@infix func *(lhs: AttributeArgument, multiplier: CGFloat) -> AttributeArgument {
	return lhs.updateMultiplier(multiplier)
}

@infix func *(multiplier: CGFloat, rhs: AttributeArgument) -> AttributeArgument {
	return rhs.updateMultiplier(multiplier)
}

@infix func +(lhs: AttributeArgument, constant: CGFloat) -> AttributeArgument {
	return lhs.updateConstant(constant)
}

@infix func -(lhs: AttributeArgument, constant: CGFloat) -> AttributeArgument {
	return lhs.updateConstant(-constant)
}

// MARK: Comparison Operators

func ==(lhs: AttributeArgument, rhs: AttributeArgument) -> Expression<AttributeArgument, AttributeArgument> {
	return Expression(lhs: lhs, relation: .Equal, rhs: rhs)
}

func <=(lhs: AttributeArgument, rhs: AttributeArgument) -> Expression<AttributeArgument, AttributeArgument> {
	return Expression(lhs: lhs, relation: .LessThanOrEqual, rhs: rhs)
}

func >=(lhs: AttributeArgument, rhs: AttributeArgument) -> Expression<AttributeArgument, AttributeArgument> {
	return Expression(lhs: lhs, relation: .GreaterThanOrEqual, rhs: rhs)
}