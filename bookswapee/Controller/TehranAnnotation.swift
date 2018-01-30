//
//  File.swift
//  bookswapee
//
//  Created by Apple on 11/10/1396 AP.
//  Copyright © 1396 AP Amin Torabi. All rights reserved.
//

import Foundation
import MapKit
class TehranAnnotation: NSObject,MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
     init(title:String,subtitle:String,coordinate:CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        self.subtitle = subtitle
    }
}
