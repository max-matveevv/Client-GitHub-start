//
//  RepoCell.swift
//  Client GitHub
//
//  Created by Max on 06.12.16.
//  Copyright © 2016 Max. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var privacyIconImageView: UIImageView!
    
    static var reposList: [Repository]?
    
    // MARK: App Delegates
    
    func setData(data: Repository?) {
        nameLabel.text = data?.name
        descriptionLabel.text = data?.description
        privacyIconImageView.image = UIImage(named: (data?.isPrivate ?? false) ? "Lock" : "Unlock")
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath as   IndexPath)
        
        nameLabel.text = RepoCell.reposList?[0].name
        
        return cell
    }
}
