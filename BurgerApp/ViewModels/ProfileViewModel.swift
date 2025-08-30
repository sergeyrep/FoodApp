import Foundation
import Combine

final class ProfileViewModel: ObservableObject {
  
  @Published var name: String = ""
  @Published var email: String = ""
  @Published var password: String = ""
  @Published var confirmPassword: String = ""
  @Published var errorMessage: String?
  @Published var isAuthenticated: Bool = false
  
  private var cancellables = Set<AnyCancellable>()
}
