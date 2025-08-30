import Foundation
import CoreData

class AuthService {
  let context: NSManagedObjectContext
  
  init(context: NSManagedObjectContext) {
    self.context = context
  }
  
  func registerUser(email: String, password: String, name: String) throws -> User {
    guard isValidEmail(email) else {
      throw AuthError.invalidEmail
    }
    
    guard password.count >= 6 else {
      throw AuthError.passwordTooShort
    }
    
    if isEmailRegistered(email) {
      throw AuthError.emailAlreadyInUse
    }
    
    let newUser = User(context: context)
    newUser.id = UUID()
    newUser.email = email.lowercased()
    newUser.password = AuthService.hashPassword(password)
    newUser.name = name
    
    try context.save()
    
    return newUser
  }
  
  func loginUser(email: String, password: String) throws -> User {
    let request: NSFetchRequest<User> = User.fetchRequest()
    request.predicate = NSPredicate(format: "email == %@", email.lowercased())
    request.fetchLimit = 1
    
    let users = try context.fetch(request)
    
    guard let user = users.first else {
      throw AuthError.userNotFound
    }
    
    // Отладочная информация
        print("=== ДЕБАГГИНГ ===")
        print("Введенный пароль: \(password)")
        print("Сохраненный хэш: \(user.password ?? "nil")")
    
    let inputPasswordHash = AuthService.hashPassword(password)
    print("Хэш введенного пароля: \(inputPasswordHash)")
    print("Совпадение: \(user.password == inputPasswordHash)")
    print("=================")
    guard user.password == inputPasswordHash else {
      print("Ожидался хэш: \(user.password ?? "nil")")
      print("Получен хэш: \(inputPasswordHash)")
      throw AuthError.wrongPassword
    }
    
    return user
  }
  
  private func isEmailRegistered(_ email: String) -> Bool {
    let request: NSFetchRequest<User> = User.fetchRequest()
    request.predicate = NSPredicate(format: "email == %@", email.lowercased())
    request.fetchLimit = 1
    
    do {
      let count = try context.count(for: request)
      return count > 0
    } catch {
      print("Ошибка при проверке email: \(error)")
      return false
    }
  }
  
  private func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
  }
  
  static func hashPassword(_ password: String) -> String {
    // желательно б заменить на правильное хэширование
    let data = password.data(using: .utf8)!
    return data.base64EncodedString()
  }
}

enum AuthError: LocalizedError {
  case invalidEmail
  case passwordTooShort
  case emailAlreadyInUse
  case userNotFound
  case wrongPassword
  
  var errorDescription: String? {
    switch self {
    case .invalidEmail: return "Некорректный email адрес"
    case .passwordTooShort: return "Пароль должен содержать минимум 6 символов"
    case .emailAlreadyInUse: return "Пользователь с таким email уже зарегистрирован"
    case .userNotFound: return "Пользователь не найден"
    case .wrongPassword: return "Неверный пароль"
    }
  }
}
