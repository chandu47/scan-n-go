//
//  ShopTableViewController.swift
//  barCodeScanner
//
//  Created by Chandrakant Vankayalapati on 11/03/19.
//  Copyright © 2019 Chandrakant Vankayalapati. All rights reserved.
//

import UIKit

class ShopTableViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var shopTable: UITableView!
    
   // let shops: [shopModel]
   let shopNames: [String] = ["Winterfell" , "Kings Landing" , "Harrenhal", "Dragonstone"] 
    let shopAddress: [String] = ["street 1, area 51", "22B, Baker Street", "Stark Tower,Marathahalli", "Winterfell, Bellandur"]
    let distance: [String] = ["1.2 km" , "2.3 km" , "4.5 km", "8 km"]
    let cellReuseIdentifier = "cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shopTable.delegate = self
        shopTable.dataSource = self
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.shopNames.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:CustomCell = self.shopTable.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! CustomCell
        cell.shopNameLabel.text = self.shopNames[indexPath.row]
        cell.distanceLabel.text = self.distance[indexPath.row]
        cell.addressLabel.text = self.shopAddress[indexPath.row]
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }

}
