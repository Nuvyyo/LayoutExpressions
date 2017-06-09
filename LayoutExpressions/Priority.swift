//  Copyright (c) 2015 Steve Brambilla. All rights reserved.

import UIKit

public typealias Priority = UILayoutPriority

public enum SystemPriority: Priority.RawValue {
	case required = 1000
	case defaultHigh = 750
	case defaultLow = 250
	case fittingSizeLevel = 50
}

extension Priority {
	fileprivate init(value: Float) {
		self.init(value)
	}

	fileprivate init(value: Int) {
		self.init(Float(value))
	}

	internal var isValid: Bool {
		return rawValue >= 0 && rawValue <= 1000
	}
}

precedencegroup PrioritizationPrecedence {
	lowerThan: ComparisonPrecedence
}

infix operator <<~ : PrioritizationPrecedence

public func <<~ <Expression: ExpressionProtocol>(expression: Expression, priority: Float) -> Expression {
	return expression.update(priority: Priority(value: priority))
}

public func <<~ <Expression: ExpressionProtocol>(expression: Expression, priority: Int) -> Expression {
	return expression.update(priority: Priority(value: priority))
}

public func <<~ <Expression: ExpressionProtocol>(expression: Expression, priority: SystemPriority) -> Expression {
	return expression.update(priority: Priority(value: priority.rawValue))
}
