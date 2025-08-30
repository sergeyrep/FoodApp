import CoreData
import SwiftUI

@main
struct BurgerAppApp: App {
  
  let persistenceController = PersistenceController.shared
  @StateObject private var authViewModel: AuthViewModel
  
  init() {
    let context = persistenceController.container.viewContext
    _authViewModel = StateObject(wrappedValue: AuthViewModel(context: context))
  }
  
    var body: some Scene {
        WindowGroup {
          ContentViewMainScreen()
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
            .environmentObject(authViewModel)
        }
    }
}
