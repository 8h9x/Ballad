class BMessage {
    public var what: UInt32 = 0

    var strs: [String: String] = [:]

    init() {

    }

    init(_ command: UInt32) {
        self.what = command
    }

    init(_ message: BMessage) {

    }

    func AddData(
        name: String, type: UInt8, data: Any, numBytes: UInt8, fixedSize: Bool = true,
        numItems: Int32 = 1
    ) {
        print("data added!")
    }

    func AddString(name: String, string: String) {
        self.AddData(name: name, type: 0, data: string, numBytes: UInt8(string.count))
        strs[name] = string
    }

    func FindString(name: String) -> String? {
        return strs[name]
    }
}
