//
//  ItemToCartViewController.swift
//  barCodeScanner
//
//  Created by Chandrakant Vankayalapati on 12/03/19.
//  Copyright © 2019 Chandrakant Vankayalapati. All rights reserved.
//

import UIKit

class ItemToCartViewController: UIViewController,BarCodeDelegate {
    @IBOutlet weak var ItemQuantity: UITextField!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDisplayPic: UIImageView!
    @IBOutlet weak var itemDisplayView: UIView!
    @IBOutlet weak var ItemtotalPrice: UILabel!
    
    var ItemToCart: ItemModel?
    var ItemsToCartList: [ItemModel] = []
    
    var ItemList : [ItemModel] = []
    var barcode: String = ""
    var total = 0
    var price:Float = 0.0
    func getBarcode(code: String) {
        self.barcode=code
        print(self.barcode)
        print("Yuppie")
        for item in ItemList{
            if(item.Barcode==self.barcode){
                self.ItemToCart = item
                self.itemDisplayPic.image = item.itemImage
                self.itemName.text = item.Name
                self.itemPrice.text = "$ \(item.Price)"
                self.price = item.Price
                self.total=1
                self.ItemQuantity.text = "\(self.total)"
                self.ItemtotalPrice.text = self.itemPrice.text
                self.itemDisplayView.isHidden=false
            
            }
        }
        
    }
    
    @IBAction func addToCartClicked(_ sender: Any) {
        self.ItemsToCartList+=[ItemToCart!]
        var myalert = UIAlertController(title: "Added To Cart", message: "The item "+((ItemToCart?.Name)!)+" has been added to cart.", preferredStyle: UIAlertController.Style.alert)
        let okaction=UIAlertAction(title: "Cool!", style: UIAlertAction.Style.default, handler: nil)
        myalert.addAction(okaction)
        self.present(myalert, animated: true, completion: nil)
        self.itemDisplayView.isHidden=true
    }
    
    @IBAction func discardItemButton(_ sender: Any) {
        self.itemDisplayView.isHidden=true
    }
    @IBAction func minusClicked(_ sender: Any) {
        if(self.ItemQuantity.text != "0"){
        self.total = self.total - 1
        self.ItemQuantity.text = "\(self.total)"
        self.ItemToCart?.subtract()
        self.ItemtotalPrice.text = "$ \(self.price*Float(self.total))"
    }
    }
    @IBAction func plusClicked(_ sender: Any) {
        self.total = self.total + 1
        self.ItemQuantity.text = "\(self.total)"
        self.ItemToCart?.add()
        self.ItemtotalPrice.text = "$ \(self.price*Float(self.total))"
    }
    func makeItems(){
        let itemSprite = ItemModel(Barcode: "8901764031250", Name: "Sprite 300ml Can", Price: 30.0, discount: 0, itemImage: UIImage(named: "sprite1"), quantity: 1, weight:300.0)
        let itemOrange = ItemModel(Barcode: "8901764362606", Name: "Pulpy Orange 400ml", Price: 35.0, discount: 5.0, itemImage: UIImage(named: "pulpy1" ), quantity: 1, weight:400.0)
        self.ItemList+=[itemSprite]
        self.ItemList+=[itemOrange]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.itemDisplayView.isHidden=true
        self.itemDisplayView.layer.borderWidth = 4
        self.itemDisplayView.layer.cornerRadius = 10
        makeItems()
        print(ItemList)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "scanBarcode" {
            let destinationVC = segue.destination as! BarCodeViewController
            
            destinationVC.delegate = self
        }
        
        if segue.identifier == "cartSegue" {
            let destinationVC = segue.destination as!
                CartViewController
            destinationVC.itemsInCart = self.ItemsToCartList
        }
        
    }
    
    

}
