//
//  PlaylistTableViewCell.swift
//  homework_18
//
//  Created by Александра Лесничая on 3/17/20.
//  Copyright © 2020 Alexandra Lesnichaya. All rights reserved.
//

import UIKit

class PlaylistTableViewCell: UITableViewCell {
    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var artist: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
