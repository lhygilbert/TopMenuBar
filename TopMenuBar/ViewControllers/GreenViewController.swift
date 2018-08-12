//
//  GreenViewController.swift
//  TopMenuBar
//
//  Created by Gilbert Lo on 8/11/18.
//  Copyright © 2018 Gilbert Lo. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        let label = centeredLabel()
        label.text = "GreenView"
    }
    
}
