//  Copyright (c) 2015 Steve Brambilla. All rights reserved.

import XCTest

import UIKit
@testable import LayoutExpressions

class YAxisExpressionTests: XCTestCase {

	var container = UIView()
	var subview = UIView()

	override func setUp() {
		super.setUp()

		container = UIView()
		subview = UIView()

		container.addSubview(subview)
	}

	func testYAxisExpressionWithoutConstant() {
		let containerAnchor = AxisAnchor(axis: YAxis(anchor: container.centerYAnchor), constant: UndefinedConstant())
		let subviewAnchor = AxisAnchor(axis: YAxis(anchor: subview.topAnchor), constant: UndefinedConstant())

		let expression = (subviewAnchor == containerAnchor)
		let constraint = expression.evaluateDistinct()
		XCTAssert(constraint.firstItem === subview)
		XCTAssert(constraint.secondItem === container)
		XCTAssert(constraint.firstAttribute == .Top)
		XCTAssert(constraint.secondAttribute == .CenterY)
		XCTAssert(constraint.relation == .Equal)
		XCTAssert(constraint.constant == 0)
		XCTAssert(constraint.multiplier == 1)
	}

	func testYAxisExpressionWithConstant() {
		let containerAnchor = AxisAnchor(axis: YAxis(anchor: container.centerYAnchor), constant: UndefinedConstant())
		let subviewAnchor = AxisAnchor(axis: YAxis(anchor: subview.topAnchor), constant: UndefinedConstant())

		let expression = (subviewAnchor == containerAnchor + 10)
		let constraint = expression.evaluateDistinct()
		XCTAssert(constraint.firstItem === subview)
		XCTAssert(constraint.secondItem === container)
		XCTAssert(constraint.firstAttribute == .Top)
		XCTAssert(constraint.secondAttribute == .CenterY)
		XCTAssert(constraint.relation == .Equal)
		XCTAssert(constraint.constant == 10)
		XCTAssert(constraint.multiplier == 1)
	}

	func testYAxisRelations() {
		let containerAnchor = AxisAnchor(axis: YAxis(anchor: container.centerYAnchor), constant: UndefinedConstant())
		let subviewAnchor = AxisAnchor(axis: YAxis(anchor: subview.topAnchor), constant: UndefinedConstant())

		let ltExpression = (subviewAnchor <= containerAnchor + 10)
		let ltConstraint = ltExpression.evaluateDistinct()
		XCTAssert(ltConstraint.relation == .LessThanOrEqual)

		let eqExpression = (subviewAnchor == containerAnchor + 10)
		let eqConstraint = eqExpression.evaluateDistinct()
		XCTAssert(eqConstraint.relation == .Equal)

		let gtExpression = (subviewAnchor >= containerAnchor + 10)
		let gtConstraint = gtExpression.evaluateDistinct()
		XCTAssert(gtConstraint.relation == .GreaterThanOrEqual)
	}
}
