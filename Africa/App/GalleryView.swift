//
//  GalleryView.swift
//  Africa
//
//  Created by Alex on 03/06/2022.
//

import SwiftUI

struct GalleryView: View {
    
    // MARK: - Properties
    
    @State private var selectedAnimal: String = "lion"
    
    @State private var gridColumnCount: Double = 3
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    func gridSwitch() {
        gridLayout = Array.init(repeating: GridItem(.flexible()), count: Int(gridColumnCount))
    }
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                
                // Image
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                // Slider
                Slider(value: $gridColumnCount, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumnCount) { _ in
                        gridSwitch()
                    }
                
                // Grid
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    } //: Loop
                } //: Grid
                .animation(.easeIn, value: UUID())
                .onAppear {
                    gridSwitch()
                }
                
            } //: VStack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        } //: ScrollView
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

// MARK: - Preview

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
