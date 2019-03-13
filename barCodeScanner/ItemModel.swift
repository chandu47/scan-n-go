//
//  ItemModel.swift
//  barCodeScanner
//
//  Created by Chandrakant Vankayalapati on 12/03/19.
//  Copyright © 2019 Chandrakant Vankayalapati. All rights reserved.
//

import Foundation
import UIKit

struct ItemModel{
    var Barcode: String
    var Name: String
    var Price: Float
    var discount: Float
    var itemImage: UIImage?
    var quantity: Int
    var weight: Float
    
    init(Barcode: String, Name: String, Price: Float, discount: Float, itemImage: UIImage?, quantity: Int, weight: Float) {
        self.Barcode=Barcode
        self.Name=Name
        self.Price=Price
        self.discount=discount
        self.itemImage=itemImage
        self.quantity=quantity
        self.weight=weight
    }
    
    mutating func add(){
        self.quantity=self.quantity+1
    }
    mutating func subtract(){
        self.quantity = self.quantity - 1
    }
}
