//
//  RepoCell.swift
//  Client GitHub
//
//  Created by Max on 06.12.16.
//  Copyright © 2016 Max. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {
    
    func setData(data: Repository?) {
       
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->     UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath as   IndexPath)
    return cell
    }
}
