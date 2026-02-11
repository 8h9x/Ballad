// The Swift Programming Language
// https://docs.swift.org/swift-book

import Dispatch

@main
struct Ballad {
    static func main() {
        let rect = BRect(500, 200, 1500, 900)
        nonisolated(unsafe) let win = BWindow(rect, "My test window", [])

        DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
            win.moveBy(-100, -100)
        }

        DispatchQueue.global().asyncAfter(deadline: .now() + 4.0) {
            win.resizeBy(100, 100)
        }

        win.test()

        // let app = BApplication()

        // app.appActivated = { active in
        //     print("App is activated?", active)
        // }

        // app.quitRequested = {
        //     return true
        // }

        // let threadId = app.run()
        // defer {  // not really something to defer i suppose, but just keeping here to remember it
        //     app.quit()
        // }

        // print("Application message loop has stopped, thread id:", threadId)
    }
}
