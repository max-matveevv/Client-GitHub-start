//
//  CommitList.swift
//  Client GitHub
//
//  Created by Konstantin on 06.12.16.
//  Copyright © 2016 Max. All rights reserved.
//

import UIKit

class CommitList: UITableViewCell {
    
    @IBOutlet var nameCommit: UILabel!
    @IBOutlet var whoMade: UILabel!
    @IBOutlet var myView: UIView!
    
    // MARK: App Delegates
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->     UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath as   IndexPath)
        return cell
    }
}
