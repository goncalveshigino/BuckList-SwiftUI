//
//  Location.swift
//  BucketList
//
//  Created by Goncalves Higino on 20/03/24.
//

import Foundation


struct Location: Codable, Equatable, Identifiable {
    let id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
}
