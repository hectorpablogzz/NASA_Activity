//
//  ContentView.swift
//  NASA_API
//
//  Created by Héctor Pablo González on 20/08/25.
//

import SwiftUI

struct ContentView: View {
    @State var pictureVM = PictureViewModel()
    
    var body: some View {
        VStack {
            List(pictureVM.arrPictures) { item in
                Text(item.title)
                AsyncImage(url: URL(string: item.url!))
                    .scaledToFit()
                    .frame(height: 100)
            }
            .task{
                do {
                    try await pictureVM.getPicturesNasa()
                } catch{
                    print("Error calling pictures")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
