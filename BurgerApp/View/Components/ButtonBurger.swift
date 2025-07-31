import SwiftUI

struct ButtonBurger: View {
  var vm: Products
  @State var animation = false
  
  var body: some View {
    
    NavigationLink(destination: DetailBurgerScreen(vm: vm)) {
      VStack {
        Image(vm.image)
          .resizable()
          .scaledToFit()
          .frame(width: 120, height: 120)
          .cornerRadius(10)
        Text(vm.name)
          .font(.headline)
          .foregroundColor(.black)
        
        Text(vm.subName)
          .font(.caption)
          .foregroundColor(.gray)
          .lineLimit(2)
        
        HStack {
          
          Image(CustomImage.star)
          Text(vm.rating)
            .font(.subheadline)
          Spacer()
          Button {
            
          } label: {
            Image(systemName: "heart")
              .foregroundStyle(.red)
          }
        }        
      }
      .padding()
    }
    .frame(maxWidth: 185, maxHeight: 225)
    .background(.white)
    .cornerRadius(20)
    .shadow(radius: 10)
    .overlay(RoundedRectangle(cornerRadius: 20)
      .stroke(Color.gray.opacity(0.2), lineWidth: 1)
    )
  }
}

#Preview {
  ButtonBurger(vm: .mock)
}
