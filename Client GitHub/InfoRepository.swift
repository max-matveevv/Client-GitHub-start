//
//  InfoRepository.swift
//  Client GitHub
//
//  Created by Mikhail on 01.12.16.
//  Copyright © 2016 Max. All rights reserved.
//

import UIKit
import Alamofire

class InfoRepository: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var desriptionLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var watchesLabel: UILabel!
    @IBOutlet weak var forksCountLabel: UILabel!
    @IBOutlet weak var watchesCountLabel: UILabel!
    
    var reposList: [Repository]?
    
    // MARK: Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setData(data: Repository?) {
        
    }

}
