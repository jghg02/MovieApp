//
//  MovieDetailScreen.swift
//  MoviesMVVM
//
//  Created by Josue German Hernandez Gonzalez on 07-01-22.
//

import SwiftUI

struct MovieDetailScreen: View {
    
    let imdbId: String
    @ObservedObject var viewModel = MovieDetailViewModel()
    
    var body: some View {
        VStack{
            if viewModel.loadingState == .loading {
                LoadingView()
            } else if viewModel.loadingState == .success {
                DetailView(detailViewModel: viewModel)
            } else if viewModel.loadingState == .failed {
                FailedView()
            }
        }
        
        .onAppear{
            self.viewModel.getDetail(by: self.imdbId)
        }
    }
}

struct MovieDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailScreen(imdbId: "")
    }
}
