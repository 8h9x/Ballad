class BLooper {
    static func looperForThread(thread: Int) -> BLooper {
        return BLooper()
    }

    func dispatchMessage(_ message: BMessage, _ target: BHandler) {

    }

    func quitRequested() -> Bool {
        return false
    }

    func addCommonFilter(_ filter: BMessageFilter) {

    }

    func removeCommonFilter(_ filter: BMessageFilter) -> Bool {
        return false
    }

    func setCommonFilterList(_ filters: [BMessageFilter]) {

    }

    func commonFilterList() -> [BMessageFilter] {
        return [BMessageFilter()]
    }

    func addHandler(_ handler: BHandler) {

    }

    func removeHandler(_ handler: BHandler) -> Bool {
        return false
    }

    func handlerAt(_ index: Int32) -> BHandler {
        return BHandler()
    }

    func countHandlers() -> Int32 {
        return 0
    }

    func indexOf(_ handler: BHandler) -> Int32 {
        return 0
    }

    func currentMessage() -> BMessage {
        return BMessage()
    }

    func detachCurrentMessage() -> BMessage {
        return BMessage()
    }

    func lock() -> Bool {
        return false
    }

    func lockWithTimeout(_ timeout: Duration) -> Duration {
        return .microseconds(0)
    }

    func unlock() {

    }

    func lockingThread() -> Int {
        return 0
    }

    func isLocked() -> Bool {
        return false
    }

    func countLocks() -> Int32 {
        return 0
    }

    func countLockRequests() -> Int32 {
        return 0
    }

    func sem() -> Int32 {
        return 0
    }

    func messageReceived(_ message: BMessage) {

    }

    func messageQueue() -> BMessageQueue {
        return BMessageQueue()
    }

    func postMessage(_ message: BMessage) -> Int {
        return 0
    }

    func postMessage(_ command: UInt32) -> Int {
        return 0
    }

    func postMessage(_ message: BMessage, _ handler: BHandler, _ replyHandler: BHandler?) -> Int {
        return 0
    }

    func postMessage(_ command: UInt32, _ handler: BHandler, _ replyHandler: BHandler?) -> Int {
        return 0
    }

    func quit() {

    }

    func run() -> Int {
        return 0
    }

    func setPrefferedHandler(_ handler: BHandler) {

    }

    func prefferedHandler() -> BHandler {
        return BHandler()
    }

    func thread() -> Int {
        return 0
    }

    func team() -> Int {
        return 0
    }
}
