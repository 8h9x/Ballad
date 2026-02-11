class BAlert {
    init(
        title: String, text: String, button0Label: String, button1Label: String,
        button2Label: String, widthStyle: UInt8, type: UInt8
    ) {

    }

    init(
        title: String, text: String, button0Label: String, button1Label: String,
        button2Label: String, widthStyle: UInt8, spacing: UInt8, type: UInt8
    ) {

    }

    init(_ archive: BMessage) {

    }

    func alertPosition(_ width: Float, _ height: Float) -> BPoint {
        return BPoint(width, height)
    }

    func buttonAt(_ index: Int32) -> BButton {
        return BButton()
    }

    func go() -> Int32 {
        return 0
    }

    func go(_ invoker: BInvoker) -> UInt8 {
        return 0
    }

    func setShortcut(index: Int32, shortcut: CChar) {

    }

    func shortcut(index: Int32) -> CChar {
        return 0
    }

    func textView() -> BTextView {
        return BTextView()
    }
}
