//
//  CommitCell.swift
//  Client GitHub
//
//  Created by Max on 13.12.16.
//  Copyright © 2016 Max. All rights reserved.
//

import UIKit

class CommitCell: UITableViewCell {
    
    @IBOutlet weak var nameCommit: UILabel!
    @IBOutlet weak var whoMade: UILabel!
    @IBOutlet weak var cellCommit: UIView!
    
    func setData(data: Commit?) {
      nameCommit.text = data?.commit
    }
}
