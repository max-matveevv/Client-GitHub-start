//
//  CommitList.swift
//  Client GitHub
//
//  Created by Konstantin on 06.12.16.
//  Copyright © 2016 Max. All rights reserved.
//

import UIKit

class CommitList: UITableViewController {

    var commitList: [CommitCell]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //    RepoCell.tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: )
        API.sharedInstance.getCommit { (commitList, err) in
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return commitList?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commitListVC", for: indexPath as   IndexPath) as! CommitCell
//        cell.setData(data: commitList?[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "commitListVC") as! CommitList
//        vc.setData(data: commitList?[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
