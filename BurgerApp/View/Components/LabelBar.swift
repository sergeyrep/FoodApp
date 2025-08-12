import SwiftUI

struct LabelBar: View {
  var body: some View {
    HStack(spacing: 0) {
      VStack(alignment: .leading) {
        Text("БутерБургер")
          .font(Font.custom(.lobster, size: 45))
          .foregroundColor(.reds)
        Text("Закажите свой любимый бургер")
          .font(Font.custom(.popins, size: 20))
          .foregroundColor(.white)
      }
      
      Spacer()
      Image(systemName: "square.and.arrow.up.circle.fill")
    }
    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
  }
}

#Preview {
    LabelBar()
}
