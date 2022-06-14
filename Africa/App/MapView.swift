//
//  MapView.swift
//  Africa
//
//  Created by Alex on 03/06/2022.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    // MARK: - Properties
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        
        var zoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: zoomLevel)
        
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    // MARK: - Body
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            // Old style: pin, always static
            //MapPin(coordinate: item.location, tint: .accentColor)
            
            // New style: map marker, always static
            //MapMarker(coordinate: item.location, tint: .accentColor)
            
            // Custom basic annotation, can be interactive
            //MapAnnotation(coordinate: item.location) {
            //    Image("logo")
            //        .resizable()
            //        .scaledToFit()
            //        .frame(width: 32, height: 32, alignment: .center)
            //} //: Annotation
            
            // Custom advanced annotation, can be interactive
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        } //: Map
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.latitude)")
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.longitude)")
                            .foregroundColor(.white)
                    }
                }
            } //: HStack
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding()
            , alignment: .top
        ) //: Overlay
    }
}

// MARK: - Preview

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
