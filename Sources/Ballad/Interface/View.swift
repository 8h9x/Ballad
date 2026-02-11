class BView {
    init(frame: BRect, name: String, resizingMode: UInt32, flags: UInt32) {

    }

    init(_ archive: BMessage) {

    }

    func archive(_ archive: BMessage, _ deep: Bool = true) -> UInt8 {
        return 0
    }

    func bounds() -> BRect {
        return BRect()
    }

    func convertToParent(_ localPoint: BPoint) -> BPoint {
        return BPoint()
    }

    func convertToParent(_ localRect: BRect) -> BRect {
        return BRect()
    }

    func convertFromParent(_ parentPoint: BPoint) -> BPoint {
        return BPoint()
    }

    func convertFromParent(_ parentRect: BRect) -> BRect {
        return BRect()
    }

    func convertToScreen(_ localPoint: BPoint) -> BPoint {
        return BPoint()
    }

    func convertToScreen(_ localRect: BRect) -> BRect {
        return BRect()
    }

    func convertFromScreen(_ screenPoint: BPoint) -> BPoint {
        return BPoint()
    }

    func convertFromScreen(_ screenRect: BRect) -> BRect {
        return BRect()
    }

    func frame() -> BRect {
        return BRect()
    }

    func hide() {

    }

    func show() {

    }

    func isFocus() -> Bool {
        return false
    }

    func isHidden() -> Bool {
        return false
    }

    func isPrinting() -> Bool {
        return false
    }

    func leftTop() -> BPoint {
        return BPoint()
    }

    func moveBy(_ horizontal: Float, _ vertical: Float) {

    }

    func moveTo(_ point: BPoint) {

    }

    func moveTo(_ x: Float, _ y: Float) {

    }

    func resizeBy(_ horizontal: Float, _ vertical: Float) {

    }

    func resizeTo(_ x: Float, _ y: Float) {

    }

    func setFlags(_ mask: UInt32) {

    }

    func flags() -> UInt32 {
        return 0
    }

    func setOrigin(_ pt: BPoint) {

    }

    func setOrigin(_ x: Float, y: Float) {

    }

    func origin() -> BPoint {
        return BPoint()
    }

    func setResizingMode(_ mode: UInt32) {

    }

    func resizingMode() -> UInt32 {
        return 0
    }

    func setCursorView(_ cursor: BCursor, _ sync: Bool = true) {

    }

    func window() -> BWindow {
        return BWindow(BRect(), "", WindowFlags())
    }

    func addChild(_ aView: BView, _ sibling: BView?) {

    }

    func removeChild(_ aView: BView) -> Bool {
        return false
    }

    func findView(_ name: String) -> BView {
        return BView(BMessage())
    }

    func parent() -> BView {
        return BView(BMessage())
    }

    func nextSibling() -> BView {
        return BView(BMessage())
    }

    func previousSibling() -> BView {
        return BView(BMessage())
    }

    func childAt(index: Int32) -> BView {
        return BView(BMessage())
    }

    func countChildren() -> Int32 {
        return 0
    }

    func removeSelf() -> Bool {
        return false
    }

    func beginRectTracking(_ rect: BRect, how: UInt32) {

    }

    func endRectTracking() {

    }

    func dragMessage(message: BMessage, rect: BRect, replyTarget: BHandler?) {

    }

    func dragMessage(message: BMessage, bitmap: BBitmap, point: BPoint, replyTarget: BHandler?) {

    }

    func dragMessage(
        message: BMessage, image: BBitmap, dragMode: UInt8, offset: BPoint, replyTarget: BHandler?
    ) {

    }

    func getMouse(_ cursor: BPoint, _ buttons: UnsafePointer<UInt32>, _ checkQueue: Bool = true) {

    }

    func makeFocus(_ focus: Bool = true) {

    }

    func scrollBar(_ posture: Orientation) -> BScrollBar {
        return BScrollBar()
    }

    func scrollBy(_ horizontal: Float, _ vertical: Float) {

    }

    func scrollTo(_ point: BPoint) {

    }

    func scrollTo(_ x: Float, _ y: Float) {

    }

    func setEventMask(_ events: UInt32, _ options: UInt32 = 0) -> UInt8 {
        return 0
    }

    func setMouseEventMask(_ events: UInt32, _ options: UInt32 = 0) -> UInt8 {
        return 0
    }

    func eventMask() -> UInt32 {
        return 0
    }

    func movePenBy(_ horizontal: Float, _ vertical: Float) {

    }

    func movePenTo(_ point: BPoint) {

    }

    func movePenTo(_ x: Float, _ y: Float) {

    }

    func penLocation() -> BPoint {
        return BPoint()
    }

    func pushState() {

    }

    func popState() {

    }

    typealias cap_mode = UInt8
    typealias join_mode = UInt8
    func setLineMode(_ lineCap: cap_mode, _ lineJoin: join_mode, _ miterLimit: Float) {

    }

    func lineCapMode() -> cap_mode {
        return 0
    }

    func lineJoinMode() -> join_mode {
        return 0
    }

    func lineMiterLimit() -> Float {
        return 0
    }

    func setScale(_ ratio: Float) {

    }

    func setPenSize(_ size: Float) {

    }

    func penSize() -> Float {
        return 0
    }

    typealias rgb_color = UInt8
    func setHighColor(_ color: rgb_color) {

    }

    func setHighColor(red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8 = 255) {

    }

    func highColor() -> rgb_color {
        return 0
    }

    func setLowColor(_ color: rgb_color) {

    }

    func setLowColor(red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8 = 255) {

    }

    func lowColor() -> rgb_color {
        return 0
    }

    func setViewColor(_ color: rgb_color) {

    }

    func setViewColor(red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8 = 255) {

    }

    func viewColor() -> rgb_color {
        return 0
    }

    typealias source_alpha = UInt8
    typealias alpha_function = UInt8
    func setBlendingMode(_ alphaSrcMode: source_alpha, _ alphaFncMode: alpha_function) {

    }

    // virtual void GetBlendingMode(source_alpha* alphaSrcMode, alpha_function* alphaFncMode);
    func getBlendingMode() -> (source_alpha, alpha_function) {
        return (0, 0)
    }

    typealias drawing_mode = UInt8
    func setDrawingMode(_ mode: drawing_mode) {

    }

    func drawingMode() -> drawing_mode {
        return 0
    }

    func forceFontAliasing(_ enable: Bool) {

    }

    typealias font_height = UInt8
    func getFontHeight() -> font_height {
        return 0
    }

    func setFont(_ font: BFont, _ properties: UInt32) {

    }

    func getFont() -> BFont {
        return BFont()
    }

    func setFontSize(_ points: Float) {

    }

    func stringWidth(_ string: String) -> Float {
        return 0
    }

    func stringWidth(_ string: String, _ length: Int32) -> Float {
        return 0
    }

    // void GetStringWidths(char* stringArray[], int32 lengthArray[], int32 numStrings, float widthArray[]) const;
    func getStringWidths(_ strings: [String], _ lengths: [Int32], _ numStrings: Int32) -> [Float] {
        return [0]
    }

    func truncateString(_ inOutString: String, _ mode: UInt32, _ width: Float) {

    }

    func clipToPicture(_ picture: BPicture, _ where: BPoint, _ sync: Bool = true) {

    }

    func clipInverseToPicture(_ picture: BPicture, _ where: BPoint, _ sync: Bool = true) {

    }

    func constrainClippingRegion(region: BRegion) {

    }

    func getClippingRegion() -> BRegion {
        return BRegion()
    }

    func drawBitmap(image: BBitmap) {

    }

    func drawBitmap(image: BBitmap, point: BPoint) {

    }

    func drawBitmap(image: BBitmap, destination: BRect) {

    }

    func drawBitmap(image: BBitmap, source: BRect, destination: BRect) {

    }

    func drawBitmapAsync(image: BBitmap) {

    }

    func drawBitmapAsync(image: BBitmap, point: BPoint) {

    }

    func drawBitmapAsync(image: BBitmap, destination: BRect) {

    }

    func drawBitmapAsync(image: BBitmap, source: BRect, destination: BRect) {

    }

    func drawChar(_ c: Character, _ point: BPoint?) {

    }

    typealias escapement_delta = UInt8
    func drawString(string: String, delta: escapement_delta?) {

    }

    func drawString(string: String, length: Int32, delta: escapement_delta?) {

    }

    func drawString(string: String, point: BPoint, delta: escapement_delta?) {

    }

    func drawString(string: String, length: Int32, point: BPoint, delta: escapement_delta?) {

    }

    typealias pattern = UInt8
    func fillRegion(_ region: BRegion, _ aPattern: pattern) {

    }

    func strokeBezier(_ controlPoints: BPoint, _ aPatter: pattern) {

    }

    func fillBezier(_ controlPoints: BPoint, _ aPatter: pattern) {

    }
}
