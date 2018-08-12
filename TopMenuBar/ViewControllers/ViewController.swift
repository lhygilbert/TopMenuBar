//
//  ViewController.swift
//  TopMenuBar
//
//  Created by Gilbert Lo on 8/11/18.
//  Copyright © 2018 Gilbert Lo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let menuTitles = ["BlueView", "GreenView", "RedView", "YelloView"]
    var viewControllers = [BlueViewController(), GreenViewController(), RedViewController(), YellowViewController()]
    let viewCellId = "viewCellId"
    
    let menuBarHeight: CGFloat = 48
    lazy var topMenuBar: TopMenuBar = {
        let menuBar = TopMenuBar(titles: menuTitles, highlightColor: .blue, unhighlightColor: .lightGray)
        menuBar.delegate = self
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        return menuBar
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: viewCellId)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Top Menu Bar"
        view.backgroundColor = .white
        
        setupViewControllers()
        setupViewsLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func setupViewControllers() {
        for vc in viewControllers {
            self.addChildViewController(vc)
            vc.didMove(toParentViewController: self)
            
            let height = view.frame.height
            let navBarHeight = self.navigationController?.navigationBar.frame.height ?? 0
            let statusBarHeight = UIApplication.shared.statusBarFrame.height

            vc.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: height - menuBarHeight - navBarHeight - statusBarHeight)
        }
    }
    
    fileprivate func setupViewsLayout() {
        view.addSubview(topMenuBar)
        topMenuBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topMenuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topMenuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topMenuBar.heightAnchor.constraint(equalToConstant: menuBarHeight).isActive = true
        
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: topMenuBar.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewCellId, for: indexPath)
        cell.contentView.addSubview(viewControllers[indexPath.item].view)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        let index = Int(x / view.frame.width)
        topMenuBar.scrollTo(index: index)
    }
    
}

extension ViewController: MenuBarDelegate {
    
    func menuDidTapped(at index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
}

