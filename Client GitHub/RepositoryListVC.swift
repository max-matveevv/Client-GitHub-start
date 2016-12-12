//
//  RepositoryListVC.swift
//  Client GitHub
//
//  Created by Mikhail on 30.11.16.
//  Copyright © 2016 Max. All rights reserved.
//

import UIKit

class RepositoryListVC: UITableViewController {
    
    var reposList: [Repository]?
    
    // MARK: Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
//    RepoCell.tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: )
        API.sharedInstance.getRepos { (reposList, err) in
            if let reposList = reposList {
                self.reposList = reposList
                self.tableView.reloadData()
            } else {
                debugPrint(err)
            }
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
        return reposList?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath as   IndexPath) as! RepoCell
        cell.setData(data: reposList?[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "repoInfoVC") as! InfoRepository
        vc.setData(data: reposList?[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
