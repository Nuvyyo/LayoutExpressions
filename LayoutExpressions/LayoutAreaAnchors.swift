//  Copyright © 2017 Steve Brambilla. All rights reserved.

import UIKit

/// A struct that directly exposes the anchors of a known layout guide.
///
/// This struct is used to simplify typing out expressions that use layout 
/// guides:
///
///     subview.anchors.left == container.anchors.readable.left
///
/// versus:
///
///     subview.anchors.left == container.readableContentGuide.anchors.left
///
/// The two preceding expressions are equivalent, but the first, which uses the
/// LayoutAreaAnchors shorthand is simpler and more legible.
public struct LayoutAreaAnchors {
	fileprivate let guide: UILayoutGuide

	public init(guide: UILayoutGuide) {
		self.guide = guide
	}
}

extension LayoutAreaAnchors {
	/// A layout expression anchor representing the leading edge of the layout area's frame.
	public var leading: AxisAnchor<XAxis, UndefinedConstant> {
		return guide.anchors.leading
	}

	/// A layout expression anchor representing the trailing edge of the layout area's frame.
	public var trailing: AxisAnchor<XAxis, UndefinedConstant> {
		return guide.anchors.trailing
	}

	/// A layout expression anchor representing the top edge of the layout area's frame.
	public var top: AxisAnchor<YAxis, UndefinedConstant> {
		return guide.anchors.top
	}

	/// A layout expression anchor representing the left edge of the layout area's frame.
	public var left: AxisAnchor<XAxis, UndefinedConstant> {
		return guide.anchors.left
	}

	/// A layout expression anchor representing the bottom edge of the layout area's frame.
	public var bottom: AxisAnchor<YAxis, UndefinedConstant> {
		return guide.anchors.bottom
	}

	/// A layout expression anchor representing the right edge of the layout area's frame.
	public var right: AxisAnchor<XAxis, UndefinedConstant> {
		return guide.anchors.right
	}

	/// A layout expression anchor representing the horizontal center of the layout area's frame.
	public var centerX: AxisAnchor<XAxis, UndefinedConstant> {
		return guide.anchors.centerX
	}

	/// A layout expression anchor representing the vertical center of the layout area's frame.
	public var centerY: AxisAnchor<YAxis, UndefinedConstant> {
		return guide.anchors.centerY
	}

	/// A layout expression anchor representing the width of the layout area's frame.
	public var width: DimensionAnchor<UndefinedMultiplier, UndefinedConstant> {
		return guide.anchors.width
	}

	/// A layout expression anchor representing the height of the layout area's frame.
	public var height: DimensionAnchor<UndefinedMultiplier, UndefinedConstant> {
		return guide.anchors.height
	}
}

extension LayoutAreaAnchors {
	/// A composite layout expression anchor representing all four edges of the layout area.
	public var edges: EdgesAnchor<UndefinedInsets> {
		return guide.anchors.edges
	}

	/// A composite layout expression anchor representing the center of the area.
	public var center: CenterAnchor<UndefinedOffset> {
		return guide.anchors.center
	}

	/// A composite layout expression anchor representing the size of the area.
	public var size: SizeAnchor<UndefinedSize> {
		return guide.anchors.size
	}
}
