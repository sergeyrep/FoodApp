import Foundation
import CoreData
import SwiftUI

class AuthViewModel: ObservableObject {
  private let authService: AuthService
  
  @Published var name: String = ""
  @Published var email: String = ""
  @Published var password: String = ""
  @Published var currentUser: User?
  @Published var isLoading: Bool = false
  @Published var isloggedIn: Bool = false
  @Published var errorMessage: String?
  @Published var avatar: UIImage?
  
  init(context: NSManagedObjectContext) {
    self.authService = AuthService(context: context)
    checkExistingUser()
  }
  
  func checkExistingUser() {
    if let userId = UserDefaults.standard.string(forKey: "currentUserId"),
      let uuid = UUID(uuidString: userId) {
        
        let request: NSFetchRequest<User> = User.fetchRequest()
      request.predicate = NSPredicate(format: "id == %@", uuid as CVarArg)
      
      do {
        let users = try authService.context.fetch(request)
        if let user = users.first {
          self.currentUser = user
          self.isloggedIn = true
          print("Автоматический вход выполнен для: \(user.name ?? "")")
        }
        
      } catch {
        print("Ошибка при автоматическом входе: \(error)")
      }
    }
  }
  
  func saveContext() {
    do {
      try authService.context.save()
      objectWillChange.send()
    } catch {
      print("error save: \(error.localizedDescription)")
    }
  }
  
  func updataCurrentEmail(_ newEmail: String) {
    guard let user = currentUser else { return }
    
    user.email = newEmail
    saveContext()
  }
  
  func updataCurrentUser(_ newName: String) {
    guard let user = currentUser else { return }
    
    user.name = newName
    saveContext()
  }
  
  func register() {
    isLoading = true
    errorMessage = nil
    
    do {
      let user = try authService.registerUser(email: email, password: password, name: name)
      currentUser = user
      isloggedIn = true
      
      if let userId = user.id?.uuidString {
        UserDefaults.standard.set(userId, forKey: "currentUserId")
      }
      
      clearForm()
      
    } catch let error as AuthError {
      errorMessage = error.errorDescription
    } catch {
      errorMessage = "Произошла неизвестная ошибка"
    }
    isLoading = false
  }
  
  func login() {
    isLoading = true
    errorMessage = nil
    
    do {
      let user = try authService.loginUser(email: email, password: password)
      currentUser = user
      isloggedIn = true
      
      if let userId = user.id?.uuidString {
        UserDefaults.standard.set(userId, forKey: "currentUserId")
      }
      
      clearForm()
      
    } catch let error as AuthError {
      errorMessage = error.errorDescription
    } catch {
      errorMessage = "hui poimi blyat"
    }
    isLoading = false
  }
  
  func logout() {
    currentUser = nil
    isloggedIn = false
    
    UserDefaults.standard.removeObject(forKey: "currentUserId")
    clearForm()
  }
  
  private func clearForm() {
    email = ""
    password = ""
    name = ""
  }
  
  class func hashPassword(_ password: String) -> String {
    // Простое хэширование для примера (в продакшене используйте bcrypt, scrypt или PBKDF2)
    let data = password.data(using: .utf8)!
    return data.base64EncodedString()
  }
}

