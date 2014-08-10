//  Copyright (c) 2014 Steve Brambilla. All rights reserved.

import UIKit

// ------------------------------------------------------------------------------------------------
// MARK: - Expression

public class Expression <L: LeftHandSideArgument, R: RightHandSideArgument> {
	private let lhs: L
	private let relation: NSLayoutRelation
	private let rhs: R
	private let priority: Priority?

	init(lhs: L, relation: NSLayoutRelation, rhs: R, priority: Priority? = nil) {
		self.lhs = lhs
		self.relation = relation
		self.rhs = rhs
		self.priority = priority
	}

	private func updatePriority(priority: Priority) -> Expression {
		return Expression(lhs: lhs, relation: relation, rhs: rhs, priority: priority)
	}

	private func evaluate() -> [NSLayoutConstraint] {
		var constraints = [NSLayoutConstraint]()

		// Create the NSLayoutConstraints.
		for leftAttribute in lhs.leftHandSideAttributes {
			let values = rhs.rightHandSideValues(leftAttribute)
			let c = NSLayoutConstraint(item: lhs.leftHandSideItem,
								  attribute: leftAttribute,
			                      relatedBy: relation,
			                         toItem: values.item,
			                      attribute: values.attribute,
								 multiplier: values.multiplier ?? 1.0,
			                       constant: values.constant ?? 0.0)
			constraints.append(c)
		}

		// Apply the priority to them.
		if let priority = priority {
			for constraint in constraints {
				constraint.priority = priority
			}
		}
		return constraints
	}
}

// ------------------------------------------------------------------------------------------------
// MARK: - Argument Protocols

public protocol LeftHandSideArgument {
	var leftHandSideItem: AnyObject { get }
	var leftHandSideAttributes: [NSLayoutAttribute] { get }
}

public protocol RightHandSideArgument {
	func rightHandSideValues(leftAttribute: NSLayoutAttribute) -> (item: AnyObject?, attribute: NSLayoutAttribute, multiplier: CGFloat?, constant: CGFloat?)
}

public protocol DistinctLeftHandSideArgument: LeftHandSideArgument {
	var distinctLeftHandSideAttribute: NSLayoutAttribute { get }
}

public protocol DistinctRightHandSideArgument: RightHandSideArgument {
	var distinctRightHandSideValue: (item: AnyObject?, attribute: NSLayoutAttribute, multiplier: CGFloat?, constant: CGFloat?) { get }
}

// ------------------------------------------------------------------------------------------------
// MARK: - Priority

public typealias Priority = Float

public enum SystemPriority: Priority {
	case Required = 1000
	case DefaultHigh = 750
	case DefaultLow = 250
	case FittingSizeLevel = 50
}

infix operator  <~ {
	associativity left
	precedence 125 // Less than the Comparative operators (130)
}

public func <~ <L: LeftHandSideArgument, R: RightHandSideArgument>(expression: Expression<L, R>, priority: SystemPriority) -> Expression<L, R> {
	return expression.updatePriority(priority.toRaw())
}

public func <~ <L: LeftHandSideArgument, R: RightHandSideArgument>(expression: Expression<L, R>, priority: Priority) -> Expression<L, R> {
	return expression.updatePriority(priority)
}

// ------------------------------------------------------------------------------------------------
// MARK: - Evaluation Functions

/// Evaluates a distinct layout expression into a single constraint.
///
/// Returns an evaluated NSLayoutConstraint
public func evaluateExpression<L: DistinctLeftHandSideArgument, R: DistinctRightHandSideArgument>(expression: Expression<L, R>) -> NSLayoutConstraint {
	let constraints = expression.evaluate()
	assert(constraints.count == 1, "A distinct expression should never evaluate to more than 1 layout constraint.")
	return constraints[0]
}

/// Evaluates a layout expression into constraints.
///
/// Returns an array of layout constraints.
public func evaluateExpression<L: LeftHandSideArgument, R: RightHandSideArgument>(expression: Expression<L, R>) -> [NSLayoutConstraint] {
	return evaluateExpressions([ expression ])
}

/// Evaluates multiple layout expressions into constraints.
///
/// Returns an array of layout constraints.
public func evaluateExpressions<L: LeftHandSideArgument, R: RightHandSideArgument>(expressions: [Expression<L, R>]) -> [NSLayoutConstraint] {
	var constraints = [NSLayoutConstraint]()
	for expr in expressions {
		constraints += expr.evaluate()
	}
	return constraints
}