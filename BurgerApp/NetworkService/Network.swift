
final class NetworkService {
  static let shared = NetworkService()
  
  private init() {}
  
  func downloadData() async throws -> [Products] {
    return Products.sampleProducts
  }
}
