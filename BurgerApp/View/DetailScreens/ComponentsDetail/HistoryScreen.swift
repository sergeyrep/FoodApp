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
          NavigationLink(destination: DetailHistoryScreen(order: order)
          ) {
            VStack(alignment: .leading) {
              Text(order.date ?? Date(), style: .date)
                .font(.headline)
              
              Spacer()
              
              if let items = order.items?.allObjects as? [OrderBurgerHistory] {
                Text("\(items.count) позиций")
                  .font(.subheadline)
                  .foregroundColor(.secondary)
              }
            }
          }
        }
        .onDelete { indexSet in
          indexSet.map {history.orders[$0] }.forEach(history.deleteOrder)
        }
      }
      .navigationTitle("История заказов")
      .gradient()
      .scrollContentBackground(.hidden)
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
  let order: OrderBurger
  
  var body: some View {
    List {
      if let items = order.items?.allObjects as? [OrderBurgerHistory] {
        ForEach(items, id: \.id) { item in
          HStack {
            Text(item.name ?? "No name")
            Spacer()
            Text("x\(item.quantity)")
            Text("\(item.price, specifier: "%.2f") ₽")
          }
        }
      }
    }
    .toolbar {
      ToolbarItem(placement: .bottomBar) {
        if let items = order.items?.allObjects as? [OrderBurgerHistory] {
          let total = items.reduce(0) { $0 + Double($1.quantity) * $1.price }
          Text("Сумма: \(total, specifier: "%.2f") ₽")
            .font(.headline)
            .foregroundColor(.red)
        }
      }
    }
  }
}

// Форматтер для даты
private let dateFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateStyle = .medium
  formatter.timeStyle = .short
  return formatter
}()


