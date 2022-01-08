//
//  URL+Extensions.swift
//  MoviesMVVM
//
//  Created by Josue German Hernandez Gonzalez on 03-01-22.
//

import Foundation

extension URL {
    static func forMoviesById(_ imdbId: String) -> URL? {
        return URL(string: "http://www.omdbapi.com/?i=\(imdbId)&apikey=\(Constants.API_KEY)")
    }
    
    static func forMoviesByName(_ name: String) -> URL? {
        return URL(string: "http://www.omdbapi.com/?s=\(name)&apikey=\(Constants.API_KEY)")
    }
}
