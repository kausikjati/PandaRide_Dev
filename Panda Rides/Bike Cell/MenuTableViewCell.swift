//
//  MenuTableViewCell.swift
//  Panda Rides
//
//  Created by Kausik Jati on 01/03/18.
//  Copyright © 2018 Kausik Jati. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var option_lbl: UILabel!
    @IBOutlet weak var option_image: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
