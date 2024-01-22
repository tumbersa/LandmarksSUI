//
//  ContentView.swift
//  Landmarks
//
//  Created by Глеб Капустин on 20.01.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
