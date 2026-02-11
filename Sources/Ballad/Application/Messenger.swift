class BMessenger: Equatable {
    let tar = 0

    static func == (lhs: BMessenger, rhs: BMessenger) -> Bool {
        return lhs.tar == rhs.tar
    }

    func isValid() -> Bool {
        return false
    }

    func lockTarget() -> Bool {
        return false
    }

    func lockTargetWithTimeout(_ timeout: Duration) -> Duration {
        return .microseconds(0)
    }

    func sendMessage(
        _ message: BMessage, _ reply: BMessage, _ deliveryTimeout: Duration,
        _ replyTimeout: Duration
    ) -> Int {
        return 0
    }

    func sendMessage(_ message: BMessage, _ replyHandler: BHandler?, _ deliveryTimeout: Duration)
        -> Int
    {
        return 0
    }

    func sendMessage(_ message: BMessage, _ replyMessenger: BMessenger, _ deliveryTimeout: Duration)
        -> Int
    {
        return 0
    }

    func sendMessage(_ command: UInt32, _ reply: BMessage) -> Int {
        return 0
    }

    func sendMessage(_ command: UInt32, _ replyHandler: BHandler?) -> Int {
        return 0
    }

    func target(_ looper: BLooper) -> BHandler {
        return BHandler()
    }

    func isTargetLocal() -> Bool {
        return false
    }

    func team() -> Int {
        return 0
    }
}
