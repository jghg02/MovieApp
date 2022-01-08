//
//  HTTPClient.swift
//  MoviesMVVM
//
//  Created by Josue German Hernandez Gonzalez on 03-01-22.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case noData
    case decodingError
}

class HTTPClient {
    
    
    func getDetail(imdbId: String, completion: @escaping (Result<MovieDetail, NetworkError>) -> Void) {
        guard let url = URL.forMoviesById(imdbId) else {
            return completion(.failure(.badUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let detail = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            completion(.success(detail))
        }.resume()
        
    }
    
    func getMovies(by search: String, completion: @escaping (Result<[Movie]?, NetworkError>) -> Void) {
        guard let url = URL.forMoviesByName(search) else {
            return completion(.failure(.badUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let moviesResponse = try? JSONDecoder().decode(MovieResponse.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            completion(.success(moviesResponse.movies))
            
        }.resume()
            
    }
}
