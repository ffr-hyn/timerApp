//
//  RapTimeTableViewCell.swift
//  timerApp
//
//  Created by 河村健太 on 2020/08/10.
//  Copyright © 2020 franzApp. All rights reserved.
//

import UIKit

class RapTimeTableViewCell: UITableViewCell {

    @IBOutlet weak var rapTime: UILabel!
    @IBOutlet weak var rapNum: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .black
        rapTime.textColor = .white
        rapNum.textColor = .white
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func congiger(num: Int) {
        self.rapNum.text = num.description
    }
    
}
