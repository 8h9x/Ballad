class BHandler {
    func messageReceived(_ message: BMessage) {

    }

    func archive() {

    }

    func getSupportedSuites(_ message: BMessage) -> Int {
        return 0
    }

    func lockLooper() -> Bool {
        return false
    }

    func lockLooperWithTimeout(_ timeout: Duration) -> Int {
        return 0
    }

    func unlockLooper() {

    }

    func looper() -> BLooper {
        return BLooper()
    }

    func resolveSpecifier(
        _ message: BMessage, _ index: Int32, _ specifier: BMessage, _ what: Int32,
        _ property: String
    ) -> BHandler {
        return BHandler()
    }

    func setFilterList(_ list: BList) {

    }

    func filterList() -> BList {
        return BList()
    }

    func addFilter(_ filter: BMessageFilter) {

    }

    func removeFilter(_ filter: BMessageFilter) -> Bool {
        return false
    }

    func setName(_ name: String) {

    }

    func name() -> String {
        return ""
    }

    func setNextHandler(_ handler: BHandler) {

    }

    func nextHandler() -> BHandler {
        return BHandler()
    }

    func sendNotices(_ what: UInt32, _ msg: BMessage) {

    }

    func startWatching(_ watcher: BMessenger, _ what: UInt32) -> Int {
        return 0
    }

    func startWatching(_ watcher: BHandler, _ what: UInt32) -> Int {
        return 0
    }

    func startWatchingAll(_ watcher: BMessenger) -> Int {
        return 0
    }

    func startWatchingAll(_ watcher: BHandler) -> Int {
        return 0
    }

    func stopWatching(_ watcher: BMessenger, _ what: UInt32) -> Int {
        return 0
    }

    func stopWatching(_ watcher: BHandler, _ what: UInt32) -> Int {
        return 0
    }

    func stopWatchingAll(_ watcher: BMessenger) -> Int {
        return 0
    }

    func stopWatchingAll(_ watcher: BHandler) -> Int {
        return 0
    }
}
