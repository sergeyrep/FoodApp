import SwiftUI

struct DetailParametr: View {
  @State var spice = 5.0
  @Binding var portion: Int
  
  var body: some View {
    HStack {
      VStack(alignment: .leading){
        Text("Spice")
        Slider(value: $spice, in: 0...10, step: 1)
          .accentColor(spice < 5 ? .green : .red)
        HStack {
          Text("Mild")
            .foregroundColor(.green)
          Spacer()
          Text("Hot")
            .foregroundColor(.red)
        }
      }
      Spacer(minLength: 100)
      VStack(alignment: .leading) {
        Text("Portion")
        HStack(alignment: .bottom) {
          Button {
            if portion > 1 { portion -= 1 }
          } label: {
            Image(.minus)
              .frame(width: 10, height: 10)
          }
          
          Spacer()
          
          Text("\(portion)")
            .font(.system(size: 25))
            .frame(maxWidth: 40)
          
          Spacer()
          
          Button {
            portion += 1
          } label: {
            Image(.plus1)
              .frame(width: 10, height: 10)
          }
        }
        .padding()
      }
    }
    .padding()
  }
}

