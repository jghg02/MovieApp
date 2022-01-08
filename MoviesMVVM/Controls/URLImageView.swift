//
//  URLImageView.swift
//  MoviesMVVM
//
//  Created by Josue German Hernandez Gonzalez on 03-01-22.
//

import Foundation
import SwiftUI

struct URLImageView: View {
    
    let url: String
    let placeholder: String
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String, placeholder: String = "placeholder") {
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.dowloadImage(from: self.url)
    }
    
    var body: some View {
      
        if let data = self.imageLoader.downloadedData {
            return Image(uiImage: UIImage(data: data)!).resizable()
        } else {
            return Image("placeholder").resizable()
        }
        
    }
    
}

struct URLImageView_Previews: PreviewProvider {
    static var previews: some View {
        URLImageView(url: "https://en.wikipedia.org/wiki/Sunset#/media/File:Anatomy_of_a_Sunset-2.jpg")
    }
}
