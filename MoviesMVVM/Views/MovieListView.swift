//
//  MovieListView.swift
//  MoviesMVVM
//
//  Created by Josue German Hernandez Gonzalez on 04-01-22.
//

import SwiftUI

struct MovieListView: View {
    
    let movies: [MovieViewModel]
    
    var body: some View {
        List(self.movies, id: \.imdbId) { movie in
            NavigationLink(destination: MovieDetailScreen(imdbId: movie.imdbId)) {
                MovieCell(movie: movie)
            }
            
        }
    }
}


struct MovieCell: View {
    let movie: MovieViewModel
    var body: some View {
        HStack(alignment: .top) {
            URLImageView(url: movie.poster)
                .frame(width: 100, height: 120)
                .cornerRadius(6)
                .scaledToFit()
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                
                Text(movie.year)
                    .opacity(0.6)
                    .padding(.top, 10)
            }.padding(5)
            Spacer()
        }.contentShape(Rectangle())
    }
}
