import SwiftUI

struct ProductGrid: View {
  
  @EnvironmentObject var vM: MainViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)], spacing: 0) {
                ForEach(vM.filteredProducts) { product in
                    ButtonBurger(vM: product)
                }
                .padding()
            }
        }
        .onAppear {
            Task {
                await vM.fetchData()
            }
        }
    }
}

#Preview {
    ProductGrid()
    .environmentObject(MainViewModel())
}
