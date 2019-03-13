//
//  PayViewController.swift
//  barCodeScanner
//
//  Created by Chandrakant Vankayalapati on 13/03/19.
//  Copyright © 2019 Chandrakant Vankayalapati. All rights reserved.
//

import UIKit

class PayViewController: UIViewController {
    @IBOutlet weak var errorView: UIView!
    
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var doneView: UIView!
    var cartList: [ItemModel?] = []
    var totalWeight: Float = 0
    let realWeight: Float = 700
    var totalPay: Float = 0
    var threshold:Float = 50
    func calWeight(){
        for item in self.cartList{
            totalWeight+=((item?.weight)!*Float((item?.quantity)!))
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        errorView.isHidden=true
        payButton.isHidden=true
        doneView.isHidden=true
        calWeight()
        print(self.totalWeight)
        print(realWeight)
        if(realWeight<=totalWeight+self.threshold){
            payButton.isHidden=false
            doneView.isHidden=false
        }
        
        else{
            errorView.isHidden=false
        }
        // Do any additional setup after loading the view.
    }

}
