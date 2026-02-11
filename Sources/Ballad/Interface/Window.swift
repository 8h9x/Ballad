struct WindowFlags: OptionSet {
    let rawValue: UInt32

    static let notMovable = WindowFlags(rawValue: 0x0000_0001)
    static let notResizable = WindowFlags(rawValue: 0x0000_0002)
    static let notHResizable = WindowFlags(rawValue: 0x0000_0004)
    static let notVResizable = WindowFlags(rawValue: 0x0000_0008)
    static let willAcceptFirstClick = WindowFlags(rawValue: 0x0000_0010)
    static let notClosable = WindowFlags(rawValue: 0x0000_0020)
    static let notZoomable = WindowFlags(rawValue: 0x0000_0040)
    static let avoidFront = WindowFlags(rawValue: 0x0000_0080)
    static let noServerSideWindowModifiers = WindowFlags(rawValue: 0x0000_0200)
    static let noWorkspaceActivation = WindowFlags(rawValue: 0x0000_0100)
    static let outlineResize = WindowFlags(rawValue: 0x0000_1000)
    static let avoidFocus = WindowFlags(rawValue: 0x0000_2000)
    static let notMinimizable = WindowFlags(rawValue: 0x0000_4000)
    static let notAnchoredOnActivate = WindowFlags(rawValue: 0x0002_0000)
    static let asynchronousControls = WindowFlags(rawValue: 0x0008_0000)
    static let quitOnWindowClose = WindowFlags(rawValue: 0x0010_0000)
    static let samePositionInAllWorkspaces = WindowFlags(rawValue: 0x0020_0000)
    static let autoUpdateSizeLimits = WindowFlags(rawValue: 0x0040_0000)
    static let closeOnEscape = WindowFlags(rawValue: 0x0080_0000)
}

#if os(Windows)
    import WinSDK

    class BWindow {
        private var _title: String
        private var _frame: BRect

        private var hwnd: HWND?

        init(_ frame: BRect, _ title: String, _ flags: WindowFlags) {
            self._title = title
            self._frame = frame
        }

        // translate
        func moveBy(_ horizontal: Float, _ vertical: Float) {
            self._frame.setLeftTop(self._frame.leftTop() + BPoint(horizontal, vertical))
            self._frame.setRightBottom(self._frame.rightBottom() + BPoint(horizontal, vertical))

            let point = self._frame.leftTop()

            SetWindowPos(
                self.hwnd, nil, Int32(point.x), Int32(point.y), 0, 0,
                UINT(SWP_NOSIZE | SWP_NOZORDER))
        }

        func moveTo(_ point: BPoint) {

        }

        func moveTo(_ x: Float, _ y: Float) {

        }

        func resizeBy(_ horizontal: Float, _ vertical: Float) {
            self._frame.setRightBottom(self._frame.rightBottom() + BPoint(horizontal, vertical))

            SetWindowPos(
                self.hwnd, nil, 0, 0, Int32(self._frame.width()), Int32(self._frame.height()),
                UINT(SWP_NOMOVE))
        }

        func resizeTo(_ x: Float, _ y: Float) {

        }

        func setTitle(_ newTitle: String) {
            self._title = newTitle
        }

        func title() -> String {
            return self._title
        }

        func test() {
            let hInstance = GetModuleHandleW(nil)
            let className = "MyWindowClass"

            var wc = WNDCLASSEXW()
            wc.cbSize = DWORD(MemoryLayout<WNDCLASSEXW>.size)
            wc.style = UINT(CS_HREDRAW | CS_VREDRAW)
            wc.lpfnWndProc = WindowProc
            wc.hInstance = hInstance
            let IDC_ARROW = UnsafePointer<UInt16>(bitPattern: 32512)
            wc.hCursor = LoadCursorW(nil, IDC_ARROW)
            // wc.hbrBackground = HBRUSH(COLOR_WINDOW + 1)
            wc.lpszClassName = className.withCString(encodedAs: UTF16.self) { $0 }

            if RegisterClassExW(&wc) == 0 {
                print("Failed to register window class")
                exit(1)
            }

            print("frame:")
            print(self._frame.height())

            let point = self._frame.leftTop()

            let hwnd = CreateWindowExW(
                0,
                className.withCString(encodedAs: UTF16.self) { $0 },
                self._title.withCString(encodedAs: UTF16.self) { $0 },
                DWORD(WS_OVERLAPPEDWINDOW),
                Int32(point.x), Int32(point.y),
                // CW_USEDEFAULT, CW_USEDEFAULT,
                self._frame.integerWidth(), self._frame.integerHeight(),
                nil, nil, hInstance, nil
            )

            if hwnd == nil {
                print("Failed to create window")
                exit(1)
            }

            self.hwnd = hwnd!

            ShowWindow(hwnd, SW_SHOW)
            UpdateWindow(hwnd)

            var msg = MSG()
            while GetMessageW(&msg, nil, 0, 0) {
                TranslateMessage(&msg)
                DispatchMessageW(&msg)
            }
        }
    }

    func WindowProc(_ hwnd: HWND?, _ uMsg: UINT, _ wParam: WPARAM, _ lParam: LPARAM) -> LRESULT {
        switch uMsg {
        case UINT(WM_DESTROY):
            PostQuitMessage(0)
            return 0
        case UINT(WM_PAINT):
            var ps = PAINTSTRUCT()
            let hdc = BeginPaint(hwnd, &ps)
            if let stockBrush = GetStockObject(WHITE_BRUSH) {
                FillRect(hdc, &ps.rcPaint, stockBrush.assumingMemoryBound(to: HBRUSH__.self))
            }
            EndPaint(hwnd, &ps)
            return 0
        default:
            return DefWindowProcW(hwnd, uMsg, wParam, lParam)
        }
    }
#elseif os(Linux)
    import CX11
    import CSkia

    class BWindow {
        private var _title: String
        private var _frame: BRect
        private var display: OpaquePointer?
        private var window: Window = 0
        private var screen: Int32 = 0

        init(_ frame: BRect, _ title: String, _ flags: WindowFlags) {
            self._title = title
            self._frame = frame
        }

        func moveBy(_ horizontal: Float, _ vertical: Float) {
            guard let display = self.display else { return }

            self._frame.setLeftTop(self._frame.leftTop() + BPoint(horizontal, vertical))
            self._frame.setRightBottom(self._frame.rightBottom() + BPoint(horizontal, vertical))

            let point = self._frame.leftTop()

            XMoveWindow(display, self.window, Int32(point.x), Int32(point.y))
            XFlush(display)  // make immediate
        }

        func resizeBy(_ horizontal: Float, _ vertical: Float) {
            guard let display = self.display else { return }

            self._frame.setRightBottom(self._frame.rightBottom() + BPoint(horizontal, vertical))

            XResizeWindow(
                display, self.window, UInt32(self._frame.width()), UInt32(self._frame.height()))
            XFlush(display)  // make immediate
        }

        func test_NOSKIA() {
            self.display = XOpenDisplay(nil)
            guard let display = display else {
                print("Cannot open display")
                return
            }

            screen = XDefaultScreen(display)

            let rootWindow = XRootWindow(display, screen)
            let white = XWhitePixel(display, screen)
            let black = XBlackPixel(display, screen)

            let point = self._frame.leftTop()

            window = XCreateSimpleWindow(
                display,
                rootWindow,
                Int32(point.x),
                Int32(point.y),
                UInt32(self._frame.width()),
                UInt32(self._frame.height()),
                1,  // border width
                black,  // border
                white  // bg
            )

            // win title
            XStoreName(display, window, self._title)

            XSelectInput(display, window, ExposureMask | KeyPressMask | ButtonPressMask)

            // show win
            XMapWindow(display, window)

            var event = XEvent()
            var running = true

            while running {
                XNextEvent(display, &event)

                switch event.type {
                case Expose:
                    print("expose event")
                case KeyPress:
                    print("key pressed")
                    running = false
                case ButtonPress:
                    print("button pressed")
                default:
                    break
                }
            }
            XDestroyWindow(display, window)
            XCloseDisplay(display)
        }

        func test() {
            self.display = XOpenDisplay(nil)
            guard let display = display else {
                print("Cannot open display")
                return
            }

            screen = XDefaultScreen(display)

            let rootWindow = XRootWindow(display, screen)
            let white = XWhitePixel(display, screen)
            let black = XBlackPixel(display, screen)

            let point = self._frame.leftTop()

            let width = Int32(self._frame.width())
            let height = Int32(self._frame.height())

            window = XCreateSimpleWindow(
                display,
                rootWindow,
                Int32(point.x),
                Int32(point.y),
                UInt32(width),
                UInt32(height),
                1,  // border width
                black,  // border
                white  // bg
            )

            XStoreName(display, window, self._title)

            XSelectInput(display, window, ExposureMask | KeyPressMask)

            XMapWindow(display, window)

            let surface = skia_surface_create(width, height)
            let canvas = skia_surface_get_canvas(surface)

            let gc = XCreateGC(display, window, 0, nil)

            var event = XEvent()
            var running = true
            while running {
                XNextEvent(display, &event)
                switch event.type {
                case Expose:
                    skia_canvas_clear(canvas, 0xFF25_00AB)

                    let paint = skia_paint_create()
                    skia_paint_set_color(paint, 0xFFF0_0E_FF)
                    skia_canvas_draw_circle(canvas, 100, 100, 50, paint)
                    skia_paint_destroy(paint)

                    if let pixels = skia_surface_get_pixels(surface) {
                        let visual = XDefaultVisual(display, screen)
                        let depth = XDefaultDepth(display, screen)

                        let ximage = XCreateImage(
                            display, visual, UInt32(depth),
                            ZPixmap, 0,
                            UnsafeMutableRawPointer(mutating: pixels),
                            UInt32(width), UInt32(height),
                            32, 0
                        )

                        XPutImage(
                            display, window, gc, ximage, 0, 0, 0, 0, UInt32(width), UInt32(height))
                        ximage?.pointee.data = nil  // holding on to skia memory as to not let x11 free it
                        // XDestroyImage(ximage) - blarghh
                    }

                case KeyPress:
                    running = false
                default:
                    break
                }
            }

            XFreeGC(display, gc)
            skia_surface_destroy(surface)
            XDestroyWindow(display, window)
            XCloseDisplay(display)
        }
    }
#endif
