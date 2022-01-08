//
//  MovieListScreen.swift
//  MoviesMVVM
//
//  Created by Josue German Hernandez Gonzalez on 04-01-22.
//

import SwiftUI

struct MovieListScreen: View {
    
    @ObservedObject private var viewModel: MovieListViewModel
    @State private var movieName = ""
    
    init() {
        self.viewModel = MovieListViewModel()
    }
    
    var body: some View {
        VStack{
            TextField("Search", text: $movieName,
                      onEditingChanged: { _ in },
                      onCommit: {
                self.viewModel.searchByName(self.movieName)
            }).textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
            
            .navigationTitle("Movies")
            
            if self.viewModel.loadingState == .success {
                MovieListView(movies: self.viewModel.movies)
            } else if self.viewModel.loadingState == .failed {
                FailedView()
            } else if self.viewModel.loadingState == .loading {
                LoadingView()
            }
            
                
        }.padding().embedNavigationView()
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
