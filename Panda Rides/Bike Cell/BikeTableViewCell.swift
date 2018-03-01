//
//  BikeTableViewCell.swift
//  Panda Rides
//
//  Created by Kausik Jati on 01/03/18.
//  Copyright © 2018 Kausik Jati. All rights reserved.
//

import UIKit

class BikeTableViewCell: UITableViewCell {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var location_lbl: UILabel!
    @IBOutlet weak var bikeName: UILabel!
    @IBOutlet weak var info_lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
