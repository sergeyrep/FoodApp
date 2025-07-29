
final class NetworkService {
  static let shared = NetworkService()
  
  private init() {}
  
  func downloadData() async -> [Products]? {
    return Products.sampleProducts
  }
}
