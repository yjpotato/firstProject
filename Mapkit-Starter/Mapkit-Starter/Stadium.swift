//
//  Stadium.swift
//  Mapkit-Starter
//
//  Created by 정유진 on 2022/09/26.
//
import CoreLocation
import Foundation
import UIKit

protocol LcoationRepresentable {
    var name: String {get set}
    var latitude: CLLocationDegrees {get set}
    var longitude: CLLocationDegrees {get set}
    
}

struct Stadium: LcoationRepresentable {
    static let stadiums = [Stadium(name: "Emirates Stadium", latitude: 51.5549, longitude: -0.108436),
                           Stadium(name: "Stamford Bridge", latitude: 51.4816, longitude: -0.191034),
                           Stadium(name: "White Hart Lane", latitude: 61.6033, longitude: -0.065684),
                           Stadium(name: "Olympic Stadium", latitude: 51.5383, longitude: -0.016587),
                           Stadium(name: "Old Trafford", latitude: 53.4631, longitude: -2.29139),
                           Stadium(name: "Anfield", latitude: 53.4308, longitude: -2.96096)]
    
    var name: String
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
    
}
