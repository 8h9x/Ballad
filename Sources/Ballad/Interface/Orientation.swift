// enum Orientation {
//     case horizontal
//     case vertical
//
//     var axis: Axis {
//         switch self {
//         case .horizontal: return .horizontal
//         case .vertical: return .vertical
//         }
//     }
//
//     init(axis: Axis) {
//         switch axis {
//         case .horizontal: self = .horizontal
//         case .vertical: self = .vertical
//         }
//     }
// }

enum Orientation: Int {
    case horizontal = 0
    case vertical = 1
}
