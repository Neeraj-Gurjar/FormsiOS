//
//  ResizeTableViewCell.swift
//  Forms_iOS
//
//  Created by bitcot on 03/06/22.
//

import UIKit

class ResizeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainImage:UIImageView!
    @IBOutlet weak var label1:UILabel!
    @IBOutlet weak var label2:UILabel!
    @IBOutlet weak var label3:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
