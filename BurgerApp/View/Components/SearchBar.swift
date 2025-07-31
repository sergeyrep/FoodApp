import SwiftUI

struct SearchBar: View {
  //@State var textSearch: String = ""
  @ObservedObject var vm: MainViewModel
  
  var body: some View {
    HStack {
      TextField("Поиск бургера", text: $vm.textSearch)
        .frame(height: 40)
        .padding(.horizontal, 36)
        .padding(.vertical, 8)
        .background(Color(.white))
        .cornerRadius(20)
        .shadow(radius: 3)
        .overlay(
          Image(systemName: "magnifyingglass")
            .foregroundStyle(.gray)
            .padding(.leading, 8),
          alignment: .leading
        )
      Button {
        
      } label: {
        Image(.iconSort)
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
      }
    }
    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
  }
}
