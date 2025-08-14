import SwiftUI

struct ProfileScreen: View {
  @StateObject var viewModel = ProfileViewModel()
  
  var body: some View {
    VStack {
      ZStack {
        ColorFon
        ProfileFoto
      }
      CustomTextField(viewModel: viewModel, placeholder: "Name")
    }
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
  
  private var ColorFon: some View {
    ZStack {
      RectangleFon
      Rectangle()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.red)
        .opacity(0.8)
        .ignoresSafeArea(.all)
    }
  }
  
  private var RectangleFon: some View {
    HStack {
      Image(.Burger1)
        .resizable()
        .frame(width: 136, height: 136)
      Spacer()
      Image(.Burger2)
        .resizable()
        .frame(width: 136, height: 136)
    }
  }
  
  private var ProfileFoto: some View {
    Image(.fotoProfile)
      .resizable()
      .shadow(radius: 8)
      .frame(width: 139, height: 139)
      .offset(y: 40)
  }
}

private struct CustomTextField: View {
  @ObservedObject var viewModel: ProfileViewModel
  var placeholder: String
  
  var body: some View {
    VStack(spacing: 10) {
      TextField(placeholder, text: $viewModel.name)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(20)
        .shadow(radius: 6)
        
      TextField(placeholder, text: $viewModel.email)
        .padding()
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(20)
        .shadow(radius: 6)
      
      SecureField(placeholder, text: $viewModel.password)
        .padding()
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(20)
        .shadow(radius: 6)
      
      SecureField(placeholder, text: $viewModel.confirmPassword)
        .padding()
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(20)
        .shadow(radius: 6)
    }
    .padding()
  }
}

#Preview {
  ProfileScreen()
}
