//
//  VideoModel.swift
//  Africa
//
//  Created by Alex on 13/06/2022.
//

import SwiftUI

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}
