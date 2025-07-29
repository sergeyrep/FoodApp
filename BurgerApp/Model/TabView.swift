
enum Tab: String, CaseIterable, Identifiable {
  case home
  case profile
  case add
  case like
  case message
  
  var id: Self { self }
}
