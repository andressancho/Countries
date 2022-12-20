//
//  CountryTableViewCell.swift
//  Countries
//
//  Created by Andres Sancho on 16/12/22.
//

import UIKit
import SDWebImage

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var countryFlag: UIImageView!
    
    @IBOutlet weak var countryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(name: String, flagUrl: URL?) {
        countryNameLabel.text = name
        
        countryFlag.sd_setImage(with: flagUrl)
        
    }
}
