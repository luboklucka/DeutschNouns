//
//  NounTableViewCell.swift
//  DeutschNouns
//
//  Created by Lubo Klucka on 12/05/2017.
//  Copyright © 2017 Lubo Klucka. All rights reserved.
//

import UIKit

class NounTableViewCell: UITableViewCell {
    @IBOutlet weak var english: UILabel!
    @IBOutlet weak var german: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)

        // Configure the view for the selected state
    }

}
