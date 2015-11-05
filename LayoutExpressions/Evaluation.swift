//  Copyright (c) 2015 Steve Brambilla. All rights reserved.

import UIKit

/// Evaluates a distinct layout expression into a single constraint.
///
/// Returns an evaluated NSLayoutConstraint
public func evaluateLayoutExpression(expression: DistinctExpressionType) -> NSLayoutConstraint {
	return expression.evaluateDistinct()
}

/// Evaluates a layout expression into constraints.
///
/// Returns an array of layout constraints.
public func evaluateLayoutExpression(expression: ExpressionType) -> [NSLayoutConstraint] {
	return expression.evaluateAll()
}

/// Evaluates multiple layout expressions into constraints.
///
/// Returns an array of layout constraints.
public func evaluateLayoutExpressions(expressions: [ExpressionType]) -> [NSLayoutConstraint] {
	return expressions.reduce([]) { acc, expression in
		return acc + expression.evaluateAll()
	}
}
