import SwiftUI
import CoreData

struct RegisterScreen: View {
  @EnvironmentObject var viewModel: AuthViewModel
  @State private var isRegistrationMode: Bool = false
  
  var body: some View {
    NavigationStack {
      ZStack {
        LinearGradient(colors: [.white, .reds, .color],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
          .ignoresSafeArea()
        
        VStack(spacing: 20) {
          mainTitle(isRegistrationMode ? "Создать аккаунт" : "Войти", color: .white)
          
          VStack(spacing: 16) {
            if isRegistrationMode {
              TextField("Имя", text: $viewModel.name)
                .textFieldStyle()
            }
            
            TextField("Email", text: $viewModel.email)
              .keyboardType(.emailAddress)
              .autocapitalization(.none)
              .textFieldStyle()
            
            SecureField("Пароль", text: $viewModel.password)
              .textFieldStyle()
          }
          .padding()
          
          Button(action: {
            isRegistrationMode ? viewModel.register() : viewModel.login()
          }) {
            if viewModel.isLoading {
              ProgressView()
                .tint(.white)
            } else {
              Text(isRegistrationMode ? "Зарегистрироваться" : "Войти")
                .fontWeight(.semibold)
            }
          }
          .buttonStyle(ActionButtonStyle(isLoading: viewModel.isLoading))
          .disabled(viewModel.isLoading)
          
          Button(action: {
            withAnimation {
              isRegistrationMode.toggle()
              viewModel.errorMessage = nil
            }
          }) {
            Text(isRegistrationMode ? "Уже есть аккаунт? Войти" : "Нет аккаунта? Зарегистрироваться")
              .foregroundColor(.color)
          }
          
          if let error = viewModel.errorMessage {
            Text(error)
              .foregroundColor(.red)
              .padding()
          }
        }
        .padding()
      }
    }
  }
}

struct TextFieldStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding()
      .background(Color.white.opacity(0.9))
      .cornerRadius(10)
      .shadow(radius: 2)
  }
}

struct ActionButtonStyle: ButtonStyle {
  let isLoading: Bool
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .frame(maxWidth: .infinity)
      .padding()
      .background(isLoading ? Color.gray : Color.color)
      .foregroundColor(.white)
      .cornerRadius(10)
      .opacity(configuration.isPressed ? 0.8 : 1.0)
  }
}


