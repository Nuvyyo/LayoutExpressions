//  Copyright (c) 2014 Steve Brambilla. All rights reserved.

import UIKit

extension UIView {
	/// The distinct .Leading layout expression argument.
	public var lexLeading: AttributeArgument {
		return AttributeArgument(item: self, attribute: .Leading)
	}

	/// The distinct .Trailing layout expression argument.
	public var lexTrailing: AttributeArgument {
		return AttributeArgument(item: self, attribute: .Trailing)
	}

	/// The distinct .Top layout expression argument.
	public var lexTop: AttributeArgument {
		return AttributeArgument(item: self, attribute: .Top)
	}

	/// The distinct .Left layout expression argument.
	public var lexLeft: AttributeArgument {
		return AttributeArgument(item: self, attribute: .Left)
	}

	/// The distinct .Bottom layout expression argument.
	public var lexBottom: AttributeArgument {
		return AttributeArgument(item: self, attribute: .Bottom)
	}

	/// The distinct .Right layout expression argument.
	public var lexRight: AttributeArgument {
		return AttributeArgument(item: self, attribute: .Right)
	}

	/// The distinct .CenterX layout expression argument.
	public var lexCenterX: AttributeArgument {
		return AttributeArgument(item: self, attribute: .CenterX)
	}

	/// The distinct .CenterY layout expression argument.
	public var lexCenterY: AttributeArgument {
		return AttributeArgument(item: self, attribute: .CenterY)
	}

	/// The distinct .Width layout expression argument.
	public var lexWidth: DimensionArgument {
		return DimensionArgument(item: self, dimension: .Width)
	}

	/// The distinct .Height layout expression argument.
	public var lexHeight: DimensionArgument {
		return DimensionArgument(item: self, dimension: .Height)
	}

	/// The distinct .Baseline layout expression argument.
	public var lexBaseline: AttributeArgument {
		return AttributeArgument(item: self, attribute: .Baseline)
	}
}

extension UIView {
	/// The composite "edges" layout expression argument.
	/// Evaluates to .Top, .Left, .Bottom, .Right constraints.
	public var lexEdges: EdgesArgument {
		return EdgesArgument(item: self)
	}
}

extension UIView {
	/// The composite "center" layout expression argument.
	/// Evaluates to .CenterX, .CenterY constraints.
	public var lexCenter: CenterArgument {
		return CenterArgument(item: self)
	}
}

extension UIView {
	/// The composite "size" layout expression argument.
	/// Evaluates to .Width, .Height constraints.
	public var lexSize: SizeArgument {
		return SizeArgument(item: self)
	}
}
