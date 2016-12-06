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
    
    /*override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        1. создать класс RepoCell: UITableViewCell
        2. все элементы интерфейса прокинуть в созданный класс (не сюда!!!)
        3. сделать в новом классе метод setData(data: Repository?)
        4. создавать ячейку с помощью dequeue for reusable inentifier..... (погуглить)
        5. Передавать в созданную ячейку данные отсюда (data: self.reposList[indexPath.row]
        6. возвращать ячейку return cell
    }*/
}
