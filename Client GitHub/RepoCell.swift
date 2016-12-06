//
//  RepoCell.swift
//  Client GitHub
//
//  Created by Max on 06.12.16.
//  Copyright © 2016 Max. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {
    @IBOutlet weak var whenMade: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    // fixed code
/*(UITableViewCell *)tableView: (UITableView *)tableView
    cellForRowAtIndexPath: (NSIndexPath *)indexPath {
        static NSString *cellIdentifier = @"myCell";
        MyCell *cell = (MyCell *) [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            NSArray *t = [[NSBundle mainBundle] loadNibNamed:@"myCellXibFileName"
                                                    owner:nil options:nil];
            for (id currentObject in t) {
                if ([currentObject isKindOfClass:[MyCell class]]) {
                    cell = (MyCell *)currentObject;
                    break;
                }
            }
        }
    return cell;
    }*/
}
 
