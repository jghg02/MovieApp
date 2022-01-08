//
//  ImageLoader.swift
//  MoviesMVVM
//
//  Created by Josue German Hernandez Gonzalez on 03-01-22.
//

import Foundation
import SwiftUI

class ImageLoader: ObservableObject {
    
    @Published var downloadedData: Data?
    
    func dowloadImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.downloadedData = data
            }
        }.resume()
    }
    
}
