//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Глеб Капустин on 20.01.2024.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modalData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modalData.landmarks.filter{ landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List{
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    let modelData = ModelData()
    return LandmarkList()
        .environment(modelData)
}
