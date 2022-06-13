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
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
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
                }
            } //: List
            .navigationBarTitle("Africa", displayMode: .large)
        } //: Navigation view
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
