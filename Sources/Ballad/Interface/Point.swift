public struct Point: Equatable, Sendable {
    public var x: Double
    public var y: Double
    
    public var description: String {
        "Point(x:\(x), y:\(y))"
    }
    
    public init(_ x: Double, _ y: Double) {
        self.x = x
        self.y = y
    }
    
    public func constrainTo(_ rect: Rect) -> Point {
        Point(
            max(min(x, rect.right), rect.left),
            max(min(y, rect.bottom), rect.top)
        )
    }
    
    public static let origin = Point(0, 0)
}
