public struct Size: Equatable, Sendable {
    public var width: Double
    public var height: Double
    
    public init(_ width: Double, _ height: Double) {
        self.width = width
        self.height = height
    }
    
    public static let zero = Size(0, 0)
}
