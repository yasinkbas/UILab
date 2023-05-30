//
//  UILab
//
//  Created on 18.02.2020.
//  Using Swift 5.0
//

import Foundation

internal struct ConstraintLog: Log {
  internal enum Message: MessagePolicy {
    var description: String {
      switch self {
      case .superviewNotFound: return "the view has no superview"
      case .noMessage: return "No message"
      case let .listened(anchor, assign1, assign2): return "listened log: \(anchor ?? "") \(assign1 ?? "") \(assign2 ?? "")"
      case let .display(wrapper): return displayMessage(wrapper)
      }
    }

    case superviewNotFound
    case listened(Any?, Any?, Any?)
    case noMessage
    case display(wrapper: ConstraintWrapper)

    func displayMessage(_ wrapper: ConstraintWrapper) -> String {
      return """
      axises: \(wrapper.axises)
      padding: \(String(describing: wrapper.padding))"
      width: \(wrapper.width)
      height: \(wrapper.height)
      enableInsets: \(wrapper.enableInsets)
      """
    }
  }

  var status: UILabLogger.LogStatus = .unknown

  let verboseName: String
  let messages: [Message]
  let constraint: Constraint?
  var description: String {
    return """
    verbose_name: \(verboseName)
    status: \(status.rawValue)
    \(messages.joined("\n"))
    constraint: \(String(describing: constraint?.description))
    """
  }

  func commit(_ type: UILabLogger.LogStatus) {
    logger?.commit(self, type: type)
  }
}
