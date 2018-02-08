//
//  CustomTableViewCell.swift
//  ExpandableTableViewCell
//
//  Created by htomcat on 2018/02/07.
//  Copyright © 2018年 htomcat. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var code: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var more: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with currency: Currency) {
        code.text = currency.code
        name.text = currency.name
        country.text = currency.country
        desc.text = currency.desc
    }

}
