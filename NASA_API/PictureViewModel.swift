//
//  File.swift
//  NASA_API
//
//  Created by Héctor Pablo González on 20/08/25.
//

import Foundation
@MainActor
@Observable
class PictureViewModel : ObservableObject {
    var arrPictures = [Picture]()
    
    func getPicturesNasa() async throws {
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=Nl7eUFPrtNnRN8S0CbjP4Mlr4LWeSpVN2FeISu2N&count=10") else {
            print("invalid URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print("error")
            return
        }
        
        let results = try JSONDecoder().decode([Picture].self, from: data)
        
        print(results)

            self.arrPictures = results
}
    
    
}
