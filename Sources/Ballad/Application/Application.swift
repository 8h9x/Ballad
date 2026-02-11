protocol BApplicationDelegate: AnyObject {
    func applicationDidRequestAbout(_ application: BApplication)
    func applicationDidActivate(_ application: BApplication)
}

class BApplication {
    var aboutRequested: (() -> Void)?
    var appActivated: ((_ active: Bool) -> Void)?
    var argvReceived: ((_ argc: Int32, _ argv: String) -> Void)?
    var pulse: (() -> Void)?
    var quitRequested: (() -> Bool)?
    var readyToRun: (() -> Void)?
    var refsReceived: ((_ message: BMessage) -> Void)?

    static func appResources() -> BResources {
        return BResources()
    }

    // may not be needed since we have a swift class, but will need to look into what this does
    static func instantiate() {

    }

    func archive() {

    }

    func dispatchMessage() {

    }

    func getAppInfo(_ appInfo: [UnsafeRawPointer: UnsafeRawPointer]) {

    }

    func getSupportedSuites(_ message: BMessage) {

    }

    func isLaunching() -> Bool {
        return false
    }

    func messageReceived() {

    }

    func resolveSpecifier() {

    }

    func run() -> Int {
        return 0
    }

    /// quit() doesn't kill the thread; it signals the looper to finish processing existing messages (blocking new ones) so run() may return.
    /// quit() returns immediately without waiting for the queue to drain.
    func quit() {

    }

    /// setCursor() sets the cursor image that's used when this is the active application.
    func setCursor(_ cursor: UnsafeRawPointer) {

    }

    /// setCursor() sets the cursor image that's used when this is the active application.
    func setCursor(_ cursor: BCursor, _ sync: Bool) {

    }

    func hideCursor() {

    }

    func showCursor() {

    }

    func obscureCursor() {

    }

    func isCursorHidden() -> Bool {
        return false
    }

    /// maybe should be an int instead
    func setPulseRate(_ rate: Duration) {

    }

    func windowAt(_ index: Int32) -> BWindow {
        return BWindow(BRect(), "My Window", WindowFlags())
    }

    func countWindows() -> Int32 {
        return 0
    }
}
