import SwiftUI

struct DetailButton: View {
  var vm: Products
  
    var body: some View {
      HStack {
        Button(action: {}) {
          Text(vm.price)
        }
        .frame(width: 104, height: 70)
        .foregroundColor(.white)
        .background(.color)
        .cornerRadius(20)
        
        Spacer()
        Button(action: {}) {
          Text("Order Now")
        }
        .frame(width: 239, height: 70)
        .foregroundColor(.white)
        .background(.color)
        .cornerRadius(20)
      }
      .padding()
    }
}

#Preview {
  DetailButton(vm: .mock)
}
