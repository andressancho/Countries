//
//  CountryTableViewCell.swift
//  Countries
//
//  Created by Andres Sancho on 16/12/22.
//

import UIKit
import SDWebImageSVGCoder

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var countryFlag: UIImageView!
    
    @IBOutlet weak var countryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(name: String, flagUrl: URL?) {
        countryNameLabel.text = name
        
        let SVGCoder = SDImageSVGCoder.shared
        SDImageCodersManager.shared.addCoder(SVGCoder)
        
        countryFlag.sd_setImage(with: flagUrl)
        
    }
}
