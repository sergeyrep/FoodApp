
import SwiftUI

@main
struct BurgerAppApp: App {
  
  let persistenceController = PersistenceController.shared
  
    var body: some Scene {
        WindowGroup {
          ContentViewMainScreen()
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
