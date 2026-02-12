// The Swift Programming Language
// https://docs.swift.org/swift-book

import Dispatch

@main
struct Ballad {
    static func main() {
        let rect = BRect(left: 50, top: 50, right: 500, bottom: 800)
        let rect2 = BRect(left: 225, top: 500, right: 800, bottom: 1000)
        nonisolated(unsafe) let win = BWindow(rect, "My test window", [])

        DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
            // win.moveBy(-100, -100)
            win.reframe(rect2)
        }

        DispatchQueue.global().asyncAfter(deadline: .now() + 4.0) {
            // win.resizeBy(100, 100)
            win.reframe(rect2 | rect)
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
