//
//  InsetFactView.swift
//  Africa
//
//  Created by Alex on 13/06/2022.
//

import SwiftUI

struct InsetFactView: View {
    
    // MARK: - Properties
    
    let animal: Animal
    
    // MARK: - Body
    
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            } //: tabView
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        } //: GroupBox
    }
}

// MARK: - Preview

struct InsetFactView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetFactView(animal: animals[4])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
