class BPoint: Equatable {
    public var x: Float = 0
    public var y: Float = 0

    var description: String {
        return "BPoint(\(x), \(y))"
    }

    init(_ x: Float, _ y: Float) {
        self.set(x, y)
    }

    init(_ point: BPoint) {
        // self.set(x, y)
    }

    init() {
        // self.set(x, y)
    }

    static func == (lhs: BPoint, rhs: BPoint) -> Bool {
        lhs.x == rhs.x && lhs.y == rhs.y
    }

    static func + (lhs: BPoint, rhs: BPoint) -> BPoint {
        BPoint(lhs.x + rhs.x, lhs.y + rhs.y)
    }

    static func += (lhs: BPoint, rhs: BPoint) {
        lhs.x += rhs.x
        lhs.y += rhs.y
    }

    static func - (lhs: BPoint, rhs: BPoint) -> BPoint {
        BPoint(lhs.x - rhs.x, lhs.y - rhs.y)
    }

    static func -= (lhs: BPoint, rhs: BPoint) {
        lhs.x -= rhs.x
        lhs.y -= rhs.y
    }

    func constrainTo(_ rect: BRect) {

    }

    func printToStream() {
        print(self)
    }

    func set(_ x: Float, _ y: Float) {
        self.x = x
        self.y = y
    }
}
