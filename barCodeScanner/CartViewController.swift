//
//  CartViewController.swift
//  barCodeScanner
//
//  Created by Chandrakant Vankayalapati on 12/03/19.
//  Copyright © 2019 Chandrakant Vankayalapati. All rights reserved.
//

import UIKit



class CartViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var totalValueLabel: UILabel!
    @IBOutlet weak var cartTable: UITableView!
    let cellReuseIdentifier = "cartCell"
    var itemsInCart: [ItemModel?] = []
    var total:Float = 0.0
    //var delegate: removeFromCartDelegate?
    @IBAction func backClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(itemsInCart)
        
        
        cartTable.delegate=self
        cartTable.dataSource=self
        // Do any additional setup after loading the view.
        
        for item in itemsInCart{
            total+=(item?.Price)!*Float((item?.quantity)!)
        }
        self.totalValueLabel.text=total.description
        self.cartTable.layer.borderWidth=3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemsInCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CartCustomCell = self.cartTable.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! CartCustomCell
        cell.ItemImage.image = self.itemsInCart[indexPath.row]?.itemImage
        cell.ItemName.text = self.itemsInCart[indexPath.row]?.Name
        cell.ItemPrice.text = (self.itemsInCart[indexPath.row]?.Price)?.description
        cell.ItemQuantity.text = (self.itemsInCart[indexPath.row]?.quantity)?.description
        cell.TotalPrice.text = "\((self.itemsInCart[indexPath.row]?.Price)!*Float((self.itemsInCart[indexPath.row]?.quantity)!))"
        cell.layer.borderWidth=1
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            var removed = self.itemsInCart.remove(at: indexPath.row)
            
            self.cartTable.deleteRows(at: [indexPath], with: .automatic)
            self.total = total-(removed?.Price)!*Float((removed?.quantity)!)
            self.totalValueLabel.text = String(self.total)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "paySegue" {
                let destinationVC = segue.destination as! PayViewController
                destinationVC.cartList=self.itemsInCart
                destinationVC.totalPay=self.total
            }
        
            
        }
    


}
