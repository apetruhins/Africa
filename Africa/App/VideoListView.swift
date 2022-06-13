//
//  VideoListView.swift
//  Africa
//
//  Created by Alex on 03/06/2022.
//

import SwiftUI

struct VideoListView: View {
    
    // MARK: - Properties
    
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    
    // Define haptics generator
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            List(videos) { item in
                NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                    VideoListItemView(video: item)
                        .padding(.vertical, 8)
                }
            } //: List
            .listStyle(.insetGrouped)
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        videos.shuffle()
                        
                        // Trigger haptics
                        hapticImpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }

                }
            }
        } //: Navigation
    }
}

// MARK: - Preview

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
