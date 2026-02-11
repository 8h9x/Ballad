class BMessage {
    var strs: [String: String] = [:]

    func AddData() {
        print("data added!")
    }

    func AddString(name: String, string: String) {
        strs[name] = string
    }

    func FindString(name: String) -> String? {
        return strs[name]
    }
}
