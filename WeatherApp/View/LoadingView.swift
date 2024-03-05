//
//  LoadingView.swift
//  WeatherApp
//
//  Created by Nitin Singh Manhas on 04/03/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

#Preview {
    LoadingView()
}
