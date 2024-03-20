//
//  ContentView.swift
//  BucketList
//
//  Created by Goncalves Higino on 10/03/24.
//
import MapKit
import SwiftUI


struct ContentView: View {
    let startPosition = MapCameraPosition.region(
     MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
     )
    )
    
    @State private var locations = [Location]()
    
    var body: some View {
        MapReader { proxy in
            Map(initialPosition: startPosition) {
                ForEach(locations) { location in
                    Marker(location.name, coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
                }
            }
            .onTapGesture { position in
                if let coordinate = proxy.convert(position, from: .local) {
                    let newLocation = Location(id: UUID(), name: "New Location", description: "Na rua 11", latitude: coordinate.latitude, longitude: coordinate.longitude)
                    locations.append(newLocation)
                }
            }
            
        }
    }
}

#Preview {
    ContentView()
}