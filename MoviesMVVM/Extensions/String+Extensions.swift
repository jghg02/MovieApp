//
//  String+Extensions.swift
//  MoviesMVVM
//
//  Created by Josue German Hernandez Gonzalez on 04-01-22.
//

import Foundation

extension String {
    func trimmedAndEscaped() -> String {
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
