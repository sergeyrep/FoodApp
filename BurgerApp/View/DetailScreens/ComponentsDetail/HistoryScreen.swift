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
        Text(order.date ?? Date(), style: .date)
        Text(order.name ?? "No name")
        Text("x\(order.quantity) - \(order.price, specifier: "%.2f")₽")
      }
      .onDelete { indexSet in
        indexSet.map {history.orders[$0] }.forEach(history.deleteOrder)
      }
    }
    .navigationTitle("History orders")
    clearAllOrdersButton
  }
  
  private var historyOrders: some View {
    Button {
      
    } label: {
      
    }
  }
  
  private var clearAllOrdersButton: some View {
    Button(action: { history.clearOrders() }) {
      Image(systemName: "trash")
    }
  }
}

struct DetailHistoryScreen: View {
  var body: some View {
    Text("DetailHistoryScreen")
  }
}
