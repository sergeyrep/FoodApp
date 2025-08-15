import SwiftUI

struct ProfileScreen: View {
  @ObservedObject var viewModel: ProfileViewModel
  @State private var showEditScreen = false
  @State private var showPaymentDetailScreen = false
  @State private var showHistoryScreen = false
  
  var body: some View {
    VStack(spacing: 0) {
      ZStack {
        ColorFon
        ProfileFoto
      }
      VStack(spacing: 10) {
        CustomTextField(viewModel: viewModel, placeholder: "Name")
        CustomTextField(viewModel: viewModel, placeholder: "E-mail")
        CustomTextField(viewModel: viewModel, placeholder: "Delivery address")
        CustomSecureField(viewModel: viewModel, placeholder: "Password")
      }
      .padding()
      .background(Color.white)
      .ignoresSafeArea(.all)
      .cornerRadius(20, corners: [.topLeft, .topRight])
      
      Divider()
      
      VStack {
        ButtonPaymentDetails
        ButtonHistory
        HStack {
          ButtonEdit
          ButtonExitProfile
        }
      }
      .padding(.bottom, 25)
      .background(Color.white)
    }
    .background(Color.red)
  }
  
  private var ButtonPaymentDetails: some View {
    Button {
      showPaymentDetailScreen = true
    } label: {
      HStack {
        Text("Детали платежа")
        Spacer()
        Image(systemName: "chevron.forward")
      }
      .padding()
      .foregroundColor(.gray)
    }
    .sheet(isPresented: $showPaymentDetailScreen) {
      PaymentDetailScreen()
    }
  }
  
  private var ButtonHistory: some View {
    Button {
      showHistoryScreen = true
    } label: {
      HStack {
        Text("История заказов")
        Spacer()
        Image(systemName: "chevron.forward")
      }
      .padding()
      .foregroundColor(.gray)
    }
    .sheet(isPresented: $showHistoryScreen) {
      HistoryScreen()
    }
  }
  
  private var ButtonExitProfile: some View {
    Button {
      
    } label: {
      HStack {
        Text("Выйти")
        Image(CustomImage.signOut)
      }
      .padding()
      .foregroundColor(.reds)
      .cornerRadius(20)
    }
  }
  
  private var ButtonEdit: some View {
    Button {
      showEditScreen = true
    } label: {
      HStack {
        Text("Редактировать профиль")
        Image(CustomImage.edit)
      }
      .padding()
      .foregroundColor(.white)
      .background(Color.color)
      .cornerRadius(20)
    }
    .sheet(isPresented: $showEditScreen) {
      EditProfileScreen()
        .presentationDetents([.medium, .large])
    }
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
    TextField(placeholder, text: $viewModel.name)
      .padding()
      .background(Color(.systemGray6))
      .cornerRadius(20)
      .shadow(radius: 6)
  }
}

private struct CustomSecureField: View {
  @ObservedObject var viewModel: ProfileViewModel
  var placeholder: String
  
  var body: some View {
    SecureField(placeholder, text: $viewModel.confirmPassword)
      .padding()
      .background(Color(.systemGray6))
      .cornerRadius(20)
      .shadow(radius: 6)
  }
}

extension View {
  func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
    clipShape(RoundedCorner(radius: radius, corners: corners))
  }
}

struct RoundedCorner: Shape {
  var radius: CGFloat = .infinity
  var corners: UIRectCorner = .allCorners
  
  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(
      roundedRect: rect,
      byRoundingCorners: corners,
      cornerRadii: CGSize(width: radius, height: radius)
    )
    return Path(path.cgPath)
  }
}


#Preview {
  ProfileScreen(viewModel: .init())
}
