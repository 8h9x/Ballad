struct BPoint: Equatable, Sendable {
    public var x: Float = 0
    public var y: Float = 0

    static let zero = BPoint(x: 0, y: 0)

    var description: String {
        return "BPoint(x:\(x), y:\(y))"
    }

    init() {

    }

    init(x: Float, y: Float) {
        self.x = x
        self.y = y
    }

    init(_ point: BPoint) {
        self.init(x: point.x, y: point.y)
    }

    mutating func constrainTo(_ rect: BRect) {
        self.x = max(min(x, rect.right), rect.left)
        self.y = max(min(y, rect.bottom), rect.top)
    }

    func printToStream() {
        print(self)
    }

    mutating func set(x: Float, y: Float) {
        self.x = x
        self.y = y
    }

    static prefix func - (point: BPoint) -> BPoint {
        return BPoint(x: -point.x, y: -point.y)
    }

    static func == (lhs: BPoint, rhs: BPoint) -> Bool {
        lhs.x == rhs.x && lhs.y == rhs.y
    }

    static func + (lhs: BPoint, rhs: BPoint) -> BPoint {
        BPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }

    static func += (lhs: inout BPoint, rhs: BPoint) {
        lhs.x += rhs.x
        lhs.y += rhs.y
    }

    static func - (lhs: BPoint, rhs: BPoint) -> BPoint {
        BPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }

    static func -= (lhs: inout BPoint, rhs: BPoint) {
        lhs.x -= rhs.x
        lhs.y -= rhs.y
    }
}
