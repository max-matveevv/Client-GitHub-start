//
//  InfoRepository.swift
//  Client GitHub
//
//  Created by Mikhail on 01.12.16.
//  Copyright © 2016 Max. All rights reserved.
//

import UIKit
import Alamofire

class InfoRepository: UITableViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var repositoryLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var forksCountLabel: UILabel!
    @IBOutlet weak var watchesLabel: UILabel!
    @IBOutlet weak var watchesCountLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var reposList: [Repository]?
    
    // MARK: Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
           nameLabel.text = reposList?[0].name
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
