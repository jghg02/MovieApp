//
//  LoadingView.swift
//  MoviesMVVM
//
//  Created by Josue German Hernandez Gonzalez on 04-01-22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
            .font(.largeTitle)
            .frame(alignment: .center)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
