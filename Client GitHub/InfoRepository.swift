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
    @IBOutlet weak var buttonCommitList: UIButton!
    @IBOutlet weak var commitsListButton: UIButton!
    
    var reposListInfo: [Repository]?
    var data: Repository?
    
    // MARK: Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData(data: data)
    }
    
    func setData(data: Repository?) {
        nameLabel.text = data?.name
        desriptionLabel.text = data?.description
        forksCountLabel.text = String(describing: data?.forksCount)
        watchesCountLabel.text = String(describing: data?.watchesCount)
        authorLabel.text = data?.owner?["login"] as? String
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func buttonCommitList(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "CommitList")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
