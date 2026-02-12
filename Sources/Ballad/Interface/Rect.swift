struct BRect: Equatable, Sendable {
    public var left: Float = 0
    public var top: Float = 0
    public var right: Float = 0
    public var bottom: Float = 0

    static let zero = BRect(left: 0, top: 0, right: 0, bottom: 0)

    var description: String {
        return "BRect(left:\(left), top:\(top), right:\(right), bottom:\(bottom))"
    }

    init() {

    }

    init(left: Float, top: Float, right: Float, bottom: Float) {
        self.set(left: left, top: top, right: right, bottom: bottom)
    }

    init(leftTop: BPoint, rightBottom: BPoint) {
        self.init(left: leftTop.x, top: leftTop.y, right: rightBottom.x, bottom: rightBottom.y)
    }

    init(_ rect: BRect) {
        self.init(leftTop: rect.leftTop(), rightBottom: rect.rightBottom())
    }

    func contains(_ point: BPoint) -> Bool {
        return point.x >= self.left && point.x <= self.right
            && point.y >= self.top && point.y <= self.bottom
    }

    func contains(_ rect: BRect) -> Bool {
        return rect.left >= self.left && rect.right <= self.right
            && rect.top >= self.top && rect.bottom <= self.bottom
    }

    func intersects(_ rect: BRect) -> Bool {
        if !self.isValid() || !rect.isValid() {
            return false
        }

        return
            !(rect.left > self.right || rect.right < self.left
            || rect.top > self.bottom || rect.bottom < self.top)
    }

    mutating func insetBy(x: Float, y: Float) {
        self.left += x
        self.top += y
        self.right -= x
        self.bottom -= y
    }

    mutating func insetBy(_ point: BPoint) {
        self.insetBy(x: point.x, y: point.y)
    }

    // func insetBySelf(x: Float, y: Float) {

    // }

    // func insetBySelf(_ point: BPoint) {

    // }

    func insetByCopy(x: Float, y: Float) -> BRect {
        var copy = BRect(self)
        copy.insetBy(x: x, y: y)
        return copy
    }

    func insetByCopy(_ point: BPoint) -> BRect {
        return self.insetByCopy(x: point.x, y: point.y)
    }

    mutating func offsetBy(x: Float, y: Float) {
        self.left += x
        self.top += y
        self.right += x
        self.bottom += y
    }

    mutating func offsetBy(_ point: BPoint) {
        self.offsetBy(x: point.x, y: point.y)
    }

    // func offsetBySelf(x: Float, y: Float) {

    // }

    // func offsetBySelf(_ point: BPoint) {

    // }

    func offsetByCopy(x: Float, y: Float) -> BRect {
        var copy = BRect(self)
        copy.offsetBy(x: x, y: y)
        return copy
    }

    func offsetByCopy(_ point: BPoint) -> BRect {
        return self.offsetByCopy(x: point.x, y: point.y)
    }

    mutating func offsetTo(x: Float, y: Float) {
        self.left = x
        self.top = y
        self.right = (right - left) + x
        self.bottom = (bottom - top) + y
    }

    mutating func offsetTo(_ point: BPoint) {
        self.offsetTo(x: point.x, y: point.y)
    }

    // func offsetToSelf(x: Float, y: Float) {

    // }

    // func offsetToSelf(_ point: BPoint) {

    // }

    func offsetToCopy(x: Float, y: Float) -> BRect {
        var copy = BRect(self)
        copy.offsetTo(x: x, y: y)
        return copy
    }

    func offsetToCopy(_ point: BPoint) -> BRect {
        return self.offsetToCopy(x: point.x, y: point.y)
    }

    func isValid() -> Bool {
        return self.right >= self.left && self.bottom >= self.top
    }

    func printToStream() {
        print(self)
    }

    mutating func set(left: Float, top: Float, right: Float, bottom: Float) {
        self.left = left
        self.top = top
        self.right = right
        self.bottom = bottom
    }

    mutating func setLeftTop(_ point: BPoint) {
        self.left = point.x
        self.top = point.y
    }

    mutating func setLeftBottom(_ point: BPoint) {
        self.left = point.x
        self.bottom = point.y
    }

    mutating func setRightTop(_ point: BPoint) {
        self.right = point.x
        self.top = point.y
    }

    mutating func setRightBottom(_ point: BPoint) {
        self.right = point.x
        self.bottom = point.y
    }

    func leftTop() -> BPoint {
        return BPoint(x: self.left, y: self.top)
    }

    func leftBottom() -> BPoint {
        return BPoint(x: self.left, y: self.bottom)
    }

    func rightTop() -> BPoint {
        return BPoint(x: self.right, y: self.top)
    }

    func rightBottom() -> BPoint {
        return BPoint(x: self.right, y: self.bottom)
    }

    func width() -> Float {
        return self.right - self.left
    }

    func integerWidth() -> Int32 {
        return Int32((self.right - self.left).rounded(.up))
    }

    func height() -> Float {
        return self.bottom - self.top
    }

    func integerHeight() -> Int32 {
        return Int32((self.bottom - self.top).rounded(.up))
    }

    static func == (lhs: BRect, rhs: BRect) -> Bool {
        return lhs.left == rhs.left && lhs.right == rhs.right && lhs.top == rhs.top
            && lhs.bottom == rhs.bottom
    }

    static func & (lhs: BRect, rhs: BRect) -> BRect {
        return BRect(
            left: max(lhs.left, rhs.left),
            top: max(lhs.top, rhs.top),
            right: min(lhs.right, rhs.right),
            bottom: min(lhs.bottom, rhs.bottom)
        )
    }

    static func &= (lhs: inout BRect, rhs: BRect) {
        lhs.left = max(lhs.left, rhs.left)
        lhs.top = max(lhs.top, rhs.top)
        lhs.right = min(lhs.right, rhs.right)
        lhs.bottom = min(lhs.bottom, rhs.bottom)
    }

    static func | (lhs: BRect, rhs: BRect) -> BRect {
        return BRect(
            left: min(lhs.left, rhs.left),
            top: min(lhs.top, rhs.top),
            right: max(lhs.right, rhs.right),
            bottom: max(lhs.bottom, rhs.bottom)
        )
    }

    static func |= (lhs: inout BRect, rhs: BRect) {
        lhs.left = min(lhs.left, rhs.left)
        lhs.top = min(lhs.top, rhs.top)
        lhs.right = max(lhs.right, rhs.right)
        lhs.bottom = max(lhs.bottom, rhs.bottom)
    }
}
