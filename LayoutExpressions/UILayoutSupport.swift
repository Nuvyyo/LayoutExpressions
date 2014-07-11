//  Copyright (c) 2014 Steve Brambilla. All rights reserved.

import UIKit

// UIViewControllers have layout guides (objects that conform to the
// UILayoutSupport protocol). But we cannot extend a protocol with concrete
// methods, so we have to bring the UILayoutSupport objects
// into our expressions by converting them to AttributeArguments.
//
// We provide two ways to do this: a UIViewController extension that adds
// `lex_`-prefixed variants of the layoutGuide properties. These use the
// 'opposite' edge as the argument's attribute.
//
//     view.lex_top == viewController.lex_topLayoutGuide
//
// Or use one of the UILayoutSupport functions, which allows you to explicitly
// specify the edge attribute and return a AttributeArgument.
//
//     view.lex_leading == leadingEdgeOf(viewController.leftLayoutGuide)

// MARK: UIViewController Extensions

extension UIViewController {
	/// The layout expression argument for the .Bottom attribute of the view controller's topLayoutGuide.
	func lex_topLayoutGuide() -> AttributeArgument {
		return AttributeArgument(item: self.topLayoutGuide, attribute: .Bottom)
	}

	/// The layout expression argument for the .Right attribute of the view controller's leftLayoutGuide.
	func lex_leftLayoutGuide() -> AttributeArgument {
		return AttributeArgument(item: self.leftLayoutGuide, attribute: .Right)
	}

	/// The layout expression argument for the .Top attribute of the view controller's topLayoutGuide.
	func lex_bottomLayoutGuide() -> AttributeArgument {
		return AttributeArgument(item: self.bottomLayoutGuide, attribute: .Top)
	}

	/// The layout expression argument for the .Left attribute of the view controller's rightLayoutGuide.
	func lex_rightLayoutGuide() -> AttributeArgument {
		return AttributeArgument(item: self.rightLayoutGuide, attribute: .Left)
	}
}

// MARK: UILayoutSupport Functions

/// Creates a layout expression argument for the .Leading attribute of the `support` layout guide.
func leadingEdgeOf(support: UILayoutSupport) -> AttributeArgument {
	return AttributeArgument(item: support, attribute: .Leading)
}

/// Creates a layout expression argument for the .Trailing attribute of the `support` layout guide.
func trailingEdgeOf(support: UILayoutSupport) -> AttributeArgument {
	return AttributeArgument(item: support, attribute: .Trailing)
}

/// Creates a layout expression argument for the .Top attribute of the `support` layout guide.
func topEdgeOf(support: UILayoutSupport) -> AttributeArgument {
	return AttributeArgument(item: support, attribute: .Top)
}

/// Creates a layout expression argument for the .Left attribute of the `support` layout guide.
func leftEdgeOf(support: UILayoutSupport) -> AttributeArgument {
	return AttributeArgument(item: support, attribute: .Left)
}

/// Creates a layout expression argument for the .Bottom attribute of the `support` layout guide.
func bottomEdgeOf(support: UILayoutSupport) -> AttributeArgument {
	return AttributeArgument(item: support, attribute: .Bottom)
}

/// Creates a layout expression argument for the .Right attribute of the `support` layout guide.
func rightEdgeOf(support: UILayoutSupport) -> AttributeArgument {
	return AttributeArgument(item: support, attribute: .Right)
}