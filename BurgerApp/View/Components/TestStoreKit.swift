//import SwiftUI
//import StoreKit
//
//struct TestStoreKit: View {
//  var body: some View {
//    SubscriptionStoreView(productIDs: ["myapp.monthly", "myapp.yearly"]) {
//      HeaderView()
//    }
//    .subscriptionStorePolicyDestination(for: .termsOfService) {
//      Text("Terms of Service")
//    }
//    .subscriptionStorePolicyDestination(for: .privacyPolicy) {
//      Text("Privacy Policy")
//    }
//    .subscriptionStorePolicyForegroundStyle(.white)
//    .subscriptionStorePickerItemBackground(.thinMaterial)
//    .subscriptionStoreControlStyle(.prominentPicker)
//    .subscriptionStoreControlBackground(
//      LinearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom)
//    )
//  }
//}
//
//struct HeaderView: View {
//  var body: some View {
//    List {
//      Section("CheckList") {
//        Text("Drink Water")
//        Text("Commit Code")
//        Text("Eat Healthy")
//      }
//      .sectionActions {
//        Button("Clear All", systemImage: "plus") {}
//      }
//    }
//  }
//}
//
//#Preview {
//    TestStoreKit()
//}
