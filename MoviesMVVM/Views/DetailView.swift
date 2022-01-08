//
//  DetailView.swift
//  MoviesMVVM
//
//  Created by Josue German Hernandez Gonzalez on 07-01-22.
//

import SwiftUI

struct DetailView: View {
    
    let detailViewModel: MovieDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                URLImageView(url: detailViewModel.poster)
                    .cornerRadius(10)
                
                Text(detailViewModel.title)
                    .font(.title)
                
                Text(detailViewModel.plot)
                Text("Director").fontWeight(.bold)
                HStack {
                    RaitingView(rating: .constant(detailViewModel.raiting))
                    Text("\(detailViewModel.raiting)/10")
                }.padding(.top, 10)
                
                Spacer()
                
            }.padding()
                .navigationBarTitle(self.detailViewModel.title)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let movieDetail = MovieDetail(title: "Batman Begins", year: "1992", rated: "PG-13", plot: "After training with his mentor, Batman begins his fight to free crime-ridden Gotham City from corruption.", director: "Christopher Nolan", actors: "", imdbRating: "4.8", poster: "https://m.media-amazon.com/images/M/MV5BZmUwNGU2ZmItMmRiNC00MjhlLTg5YWUtODMyNzkxODYzMmZlXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_SX300.jpg", imdbId: "345fgD")
        
        DetailView(detailViewModel: MovieDetailViewModel(movieDetail: movieDetail))
    }
}
