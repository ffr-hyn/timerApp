//
//  RapTableViewCell.swift
//  timerApp
//
//  Created by 河村健太 on 2020/08/10.
//  Copyright © 2020 franzApp. All rights reserved.
//

import UIKit

class RapTableViewCell: UITableViewCell {

    @IBOutlet weak var rabNumber: UILabel!
    @IBOutlet weak var rapTime: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configer(raptime: Int) {
        self.rabNumber.text = raptime.description
    }
}
