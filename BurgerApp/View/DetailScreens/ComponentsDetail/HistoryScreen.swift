import SwiftUI
import CoreData

struct HistoryScreen: View {
  @StateObject private var history: OrderViewModel
  
  init(context: NSManagedObjectContext) {
    _history = StateObject(wrappedValue: OrderViewModel(context: context))
  }
  
  var body: some View {
    List {
      ForEach(history.orders, id: \.id) { order in
        VStack(alignment: .leading) {
          Text(order.name ?? "No name")
          Text("x\(order.quantity) - \(order.price, specifier: "%.2f")₽")
          Text(order.date ?? Date(), style: .date)
        }
      }
      .onDelete { indexSet in
        indexSet.map {history.orders[$0] }.forEach(history.deleteOrder)
      }
    }
    .navigationTitle("History orders")
  }
}


