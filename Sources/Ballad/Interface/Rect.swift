class BRect {
    private var left: Float = 0
    private var top: Float = 0
    private var right: Float = 0
    private var bottom: Float = 0

    private var _width: Float = 0
    private var _height: Float = 0

    init(_ left: Float, _ top: Float, _ right: Float, _ bottom: Float) {
        self.set(left, top, right, bottom)
    }

    init(_ leftTop: BPoint, _ rightBottom: BPoint) {

    }

    init(_ rect: BRect) {

    }

    init() {

    }

    func contains(_ point: BPoint) -> Bool {
        return false
    }

    func contains(_ rect: BRect) -> Bool {
        return false
    }

    func intersects(_ rect: BRect) -> Bool {
        return false
    }

    func insetBy(_ x: Float, _ y: Float) {

    }

    func insetBy(_ point: BPoint) {

    }

    func insetBySelf(_ x: Float, _ y: Float) {

    }

    func insetBySelf(_ point: BPoint) {

    }

    func insetByCopy(_ x: Float, _ y: Float) {

    }

    func insetByCopy(_ point: BPoint) {

    }

    func offsetBy(_ x: Float, _ y: Float) {

    }

    func offsetBy(_ point: BPoint) {

    }

    func offsetBySelf(_ x: Float, _ y: Float) {

    }

    func offsetBySelf(_ point: BPoint) {

    }

    func offsetByCopy(_ x: Float, _ y: Float) {

    }

    func offsetByCopy(_ point: BPoint) {

    }

    func offsetTo(_ x: Float, _ y: Float) {

    }

    func offsetTo(_ point: BPoint) {

    }

    func offsetToSelf(_ x: Float, _ y: Float) {

    }

    func offsetToSelf(_ point: BPoint) {

    }

    func offsetToCopy(_ x: Float, _ y: Float) {

    }

    func offsetToCopy(_ point: BPoint) {

    }

    func isValid() -> Bool {
        return self.right >= self.left && self.bottom >= self.top
    }

    func printToStream() {

    }

    func set(_ left: Float, _ top: Float, _ right: Float, _ bottom: Float) {
        self.left = left
        self.top = top
        self.right = right
        self.bottom = bottom

        self._width = right - left
        self._height = bottom - top
    }

    func setLeftTop(_ point: BPoint) {
        self.set(point.x, point.y, self.right, self.bottom)
    }

    func setLeftBottom(_ point: BPoint) {
        self.set(point.x, self.top, self.right, point.y)
    }

    func setRightTop(_ point: BPoint) {
        self.set(self.left, point.y, point.x, self.bottom)
    }

    func setRightBottom(_ point: BPoint) {
        self.set(self.left, self.top, point.x, point.y)
    }

    func leftTop() -> BPoint {
        return BPoint(self.left, self.top)
    }

    func leftBottom() -> BPoint {
        return BPoint(self.left, self.bottom)
    }

    func rightTop() -> BPoint {
        return BPoint(self.right, self.top)
    }

    func rightBottom() -> BPoint {
        return BPoint(self.right, self.bottom)
    }

    func width() -> Float {
        return self._width
    }

    func integerWidth() -> Int32 {
        return Int32(self._width)
    }

    func height() -> Float {
        return self._height
    }

    func integerHeight() -> Int32 {
        return Int32(self._height)
    }
}
