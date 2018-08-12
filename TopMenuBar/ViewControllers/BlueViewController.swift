//
//  BlueViewController.swift
//  TopMenuBar
//
//  Created by Gilbert Lo on 8/11/18.
//  Copyright © 2018 Gilbert Lo. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func centeredLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 80).isActive = true
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return label
    }
    
}

class BlueViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        let label = centeredLabel()
        label.text = "BlueView"
    }
    
}
