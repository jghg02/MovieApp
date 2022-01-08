//
//  MovieDetailViewModel.swift
//  MoviesMVVM
//
//  Created by Josue German Hernandez Gonzalez on 07-01-22.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    private var movieDetail: MovieDetail?
    @Published var loadingState = LoadingState.loading
    
    private var httpClient = HTTPClient()
    
    init(movieDetail: MovieDetail? = nil) {
        self.movieDetail = movieDetail
    }
    
    func getDetail(by imdbId: String) {
        httpClient.getDetail(imdbId: imdbId) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.movieDetail = data
                    self.loadingState = .success
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
        }
    }
    
    var title: String {
        self.movieDetail?.title ?? ""
    }
    
    var poster: String {
        self.movieDetail?.poster ?? ""
    }
    
    var plot: String {
        self.movieDetail?.plot ?? ""
    }
    
    var raiting: Int {
        get {
            let rating = Double(self.movieDetail?.imdbRating ?? "0.0")
            return Int(ceil(rating ?? 0.0))
        }
    }
}
