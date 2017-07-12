//
//  ContainerViewController.swift
//  week_2_part_3
//
//  Created by 許雅筑 on 2016/9/15.
//  Copyright © 2016年 許雅筑. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {


    @IBOutlet weak var containerViewGrid: UIView!
    @IBOutlet weak var containerViewList: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "YouBike"

    }

    @IBAction func showComponent(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            UIView.animateWithDuration(0.5, animations:{
                self.containerViewList.alpha = 1
                self.containerViewGrid.alpha = 0
            })

        case 1:
            UIView.animateWithDuration(0.5, animations:{
                
                self.containerViewList.alpha = 0
                self.containerViewGrid.alpha = 1
                
            })
        default:
            break
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    



}
