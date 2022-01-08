//
//  ViewModelBase.swift
//  MoviesMVVM
//
//  Created by Josue German Hernandez Gonzalez on 04-01-22.
//

import Foundation

enum LoadingState {
    case loading, success, failed, none
}

class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .none
    
}
