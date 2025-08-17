import SwiftUI

extension AnyTransition {
 static var slideFromRight: AnyTransition {
    AnyTransition.asymmetric(
    insertion: .move(edge: .trailing),
    removal: .move(edge: .leading)
   )
  }
}
