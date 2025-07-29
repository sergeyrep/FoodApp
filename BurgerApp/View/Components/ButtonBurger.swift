import SwiftUI

struct ButtonBurger: View {
  var vM: Products
  @State var animation = false
  
  var body: some View {
    
    NavigationLink(destination: DetailBurgerScreen(vm: vM)) {
      VStack {
        Image(vM.image)
          .resizable()
          .scaledToFit()
          .frame(width: 120, height: 120)
          .cornerRadius(10)
        Text(vM.name)
          .font(.headline)
          .foregroundColor(.black)
        
        Text(vM.subName)
          .font(.caption)
          .foregroundColor(.gray)
          .lineLimit(2)
        
        HStack {
          
          Image(CustomImage.star)
          Text(vM.rating)
            .font(.subheadline)
          Spacer()
          Image(systemName: "heart")
            .foregroundStyle(.red)
        }
        .padding()
      }
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
  ButtonBurger(vM: .mock)
}
