//
//  ContentView.swift
//  Africa
//
//  Created by Alex on 03/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var contentLayout: ContentLayout = .list
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    
    // MARK: - Functions
    
    func gridSwitch(columnCount: Int) {
        gridLayout = Array(repeating: .init(.flexible()), count: columnCount)
    }
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            Group {
                if contentLayout == .list {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink {
                                AnimalDetailView(animal: animal)
                            } label: {
                                AnimalListItemView(animal: animal)
                            } //: NavigationLink
                        } //: Loop
                        
                        CreditsView()
                            .modifier(CenterModifier())
                        
                    } //: List
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                } //: Link
                            } //: Loop
                        } //: Vertical grid
                        .padding(10)
                        .animation(.easeIn, value: UUID())
                    } //: Scroll
                } //: Condition
            } //: Group
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        //List button
                        Button {
                            contentLayout = .list
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(contentLayout == .list ? .accentColor : .primary)
                        }

                        //Grid button 1
                        Button {
                            contentLayout = .grid1
                            haptics.impactOccurred()
                            gridSwitch(columnCount: 1)
                        } label: {
                            Image(systemName: "rectangle.grid.1x2")
                                .font(.title2)
                                .foregroundColor(contentLayout == .grid1 ? .accentColor : .primary)
                        }
                        //Grid button 2
                        Button {
                            contentLayout = .grid2
                            haptics.impactOccurred()
                            gridSwitch(columnCount: 2)
                        } label: {
                            Image(systemName: "square.grid.2x2")
                                .font(.title2)
                                .foregroundColor(contentLayout == .grid2 ? .accentColor : .primary)
                        }
                        
                        //Grid button 3
                        Button {
                            contentLayout = .grid3
                            haptics.impactOccurred()
                            gridSwitch(columnCount: 3)
                        } label: {
                            Image(systemName: "square.grid.3x2")
                                .font(.title2)
                                .foregroundColor(contentLayout == .grid3 ? .accentColor : .primary)
                        }
                        
                    } //: HStack
                } //: Buttons
            } //: Toolbar
        } //: Navigation view
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
