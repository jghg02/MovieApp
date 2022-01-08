//
//  View+Extensions.swift
//  MoviesMVVM
//
//  Created by Josue German Hernandez Gonzalez on 04-01-22.
//

import Foundation
import SwiftUI

extension View {
    func embedNavigationView() -> some View {
        return NavigationView { self }
    }
}
