public struct Rect: Equatable, Sendable {
    public var left: Double
    public var top: Double
    public var right: Double
    public var bottom: Double
    
    public var width: Double {
        right - left
    }
    
    public var height: Double {
        bottom - top
    }
    
    public var size: Size {
        Size(right - left, bottom - top)
    }
    
    public var leftTop: Point {
        get { Point(left, top) }
        
        set {
            left = newValue.x
            top = newValue.y
        }
    }
    
    public var rightBottom: Point {
        get { Point(right, bottom) }
        
        set {
            right = newValue.x
            bottom = newValue.y
        }
    }
    
    public var leftBottom: Point {
        get { Point(left, bottom) }
        
        set {
            left = newValue.x
            bottom = newValue.y
        }
    }
    
    public var rightTop: Point {
        get { Point(right, top) }
        
        set {
            right = newValue.x
            top = newValue.y
        }
    }
    
    public var valid: Bool {
        left <= right && top <= bottom
    }
    
    public var description: String {
        "Rect(left:\(left), top:\(top), right:\(right), bottom:\(bottom))"
    }
    
    public init(left: Double, top: Double, right: Double, bottom: Double) {
        self.left = left
        self.top = top
        self.right = right
        self.bottom = bottom
    }
    
    public init(leftTop: Point, rightBottom: Point) {
        self.init(left: leftTop.x, top: leftTop.y, right: rightBottom.x, bottom: rightBottom.y)
    }
    
    public init(leftTop: Point, size: Size) {
        self.init(
            left: leftTop.x, 
            top: leftTop.y,
            right: leftTop.x + size.width,
            bottom: leftTop.y + size.height
        )
    }
    
    public init(width: Double, height: Double) {
        self.init(left: 0, top: 0, right: width, bottom: height)
    }
    
    public init(side: Double) {
        self.init(width: side - 1, height: side - 1)
    }
    
    public func insetBy(x: Double, y: Double) -> Rect {
        Rect(
            left: left + x,
            top: top + y,
            right: right - x,
            bottom: bottom - y
        )
    }
    
    public func insetBy(inset: Point) -> Rect {
	    self.insetBy(x: inset.x, y: inset.y)
    }
    
    public func offsetBy(x: Double, y: Double) -> Rect {
        Rect(
            left: left + x,
            top: top + y,
            right: right + x,
            bottom: bottom + y
        )
    }
    
    public func offsetBy(delta: Point) -> Rect {
        self.offsetBy(x: delta.x, y: delta.y)
    }
    
    public func offsetTo(x: Double, y: Double) -> Rect {
        Rect(
            left: x,
            top: y,
            right: (right - left) + x,
            bottom: (bottom - top) + y,
        )
    }
    
    public func offsetTo(offset: Point) -> Rect {
        self.offsetTo(x: offset.x, y: offset.y)
    }
    
    public func intersects(_ rect: Rect) -> Bool {
        if !valid || !rect.valid { return false }
    
        return !(
            rect.left > right ||
            rect.right < left ||
            rect.top > bottom ||
            rect.bottom < top
        )
    }
    
    public func contains(_ point: Point) -> Bool {
        return (
            point.x >= left &&
            point.x <= right &&
            point.y >= top &&
            point.y <= bottom
        )
    }
    
    public func contains(_ rect: Rect) -> Bool {
        return (
            rect.left >= left &&
            rect.right <= right &&
            rect.top >= top &&
            rect.bottom <= bottom
        )
    }
    
    public static let zero = Rect(left: 0, top: 0, right: 0, bottom: 0)
}
