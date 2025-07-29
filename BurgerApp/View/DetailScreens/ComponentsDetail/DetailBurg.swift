import SwiftUI

struct DetailBurg: View {
  var vm: Products
  
    var body: some View {
      Image(vm.image)
        .resizable()
      Text(vm.name)
        .font(.headline)
      HStack {
        Image(CustomImage.star)
        Text(vm.rating)
        Spacer()
        Text("\(vm.timeOfCooking)")
      }
      .padding()
      Text(vm.subName)
    }
}

#Preview {
  DetailBurg(vm: .mock)
}
