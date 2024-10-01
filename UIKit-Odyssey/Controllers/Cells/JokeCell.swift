//
//  JokeCell.swift
//  UIKit-Odyssey
//
//  Created by Jaimin Raval on 26/08/24.
//

import UIKit

class JokeCell: UITableViewCell {
    @IBOutlet weak var jokeLabel: UILabel!
    
    @IBOutlet weak var punchLine: UILabel!
    
    @IBOutlet weak var jokeSetup: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
