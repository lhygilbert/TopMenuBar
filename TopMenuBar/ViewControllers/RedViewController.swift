//
//  RedViewController.swift
//  TopMenuBar
//
//  Created by Gilbert Lo on 8/11/18.
//  Copyright © 2018 Gilbert Lo. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        let label = centeredLabel()
        label.text = "RedView"
    }
    
}
