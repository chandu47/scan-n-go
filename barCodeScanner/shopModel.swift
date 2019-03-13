//
//  shopModel.swift
//  barCodeScanner
//
//  Created by Chandrakant Vankayalapati on 12/03/19.
//  Copyright © 2019 Chandrakant Vankayalapati. All rights reserved.
//

import Foundation
import GoogleMaps
struct shopModel{
    var shopName:String
    var coordi: CLLocationCoordinate2D
    var address: String
    var distance: String

    init(shopName:String, coordi: CLLocationCoordinate2D, address:String, distance:String ) {
        self.shopName = shopName
        self.coordi = coordi
        self.address = address
        self.distance = distance
    }
}
