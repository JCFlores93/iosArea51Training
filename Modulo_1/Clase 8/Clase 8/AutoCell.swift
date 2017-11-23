//
//  AutoCell.swift
//  Clase 8
//
//  Created by Alumno on 10/30/17.
//  Copyright © 2017 Franti Saúl Huamán Mera. All rights reserved.
//

import UIKit

class AutoCell: UITableViewCell {

    @IBOutlet weak var marcaLabel: UILabel!
    @IBOutlet weak var descripcionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
