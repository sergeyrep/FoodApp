import SwiftUI

struct NavBar: View {
  @Environment(\.dismiss) var dismiss
  
    var body: some View {
      HStack {
        Button {
          dismiss()
        } label: {
          Image(systemName: "arrow.backward")
        }
        Spacer()
        Button {
          
        } label: {
          Image(systemName: "magnifyingglass")
        }
      }
      .padding()
    }
}

#Preview {
    NavBar()
}
