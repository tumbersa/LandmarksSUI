//
//  HikeView.swift
//  Landmarks
//
//  Created by Глеб Капустин on 22.01.2024.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity))
    }
}


struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false
    var body: some View {
        VStack{
            HStack{
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }
                
                Spacer()
                
                Button {
                    withAnimation() {
                        showDetail.toggle()
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90: 0))
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                }
            }
            
            if showDetail {
                HikeDetail(hike: hike)
                    .transition(.moveAndFade)
            }
        }
    }
}

#Preview {
    HikeView(hike: ModelData().hikes[0])
}
