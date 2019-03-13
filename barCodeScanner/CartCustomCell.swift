//
//  TableViewCell.swift
//  barCodeScanner
//
//  Created by Chandrakant Vankayalapati on 12/03/19.
//  Copyright © 2019 Chandrakant Vankayalapati. All rights reserved.
//

import UIKit

class CartCustomCell: UITableViewCell {
    
    @IBOutlet weak var ItemQuantity: UILabel!
    @IBOutlet weak var TotalPrice: UILabel!
    @IBOutlet weak var ItemPrice: UILabel!
    @IBOutlet weak var ItemName: UILabel!
    @IBOutlet weak var ItemImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
