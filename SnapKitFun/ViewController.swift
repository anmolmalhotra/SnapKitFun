//
//  ViewController.swift
//  SnapKitFun
//
//  Created by Anmol Malhotra on 31/07/17.
//  Copyright © 2017 Anmol Malhotra. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero)
        tv.backgroundColor = .white
        tv.delegate = self
        tv.dataSource = self
        tv.allowsSelection = false
        tv.tableFooterView = UIView()
        return tv
    }()
    
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        cv.alwaysBounceVertical = true
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "SnapKit Fun"
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId1")
        
        view.addSubview(collectionView)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId2")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if previousTraitCollection?.verticalSizeClass != traitCollection.verticalSizeClass {
            switch traitCollection.verticalSizeClass {
            case .compact:
                
                // Removing TableView Constraints
                tableView.snp.removeConstraints()
                
                collectionView.snp.makeConstraints({ (make) in
                    make.edges.equalTo(view)
                })
                
            case .unspecified: fallthrough
                
            case .regular:
                
                tableView.snp.makeConstraints { (make) in
                    make.edges.equalTo(view)
                }
                // Removing CollectionView Constraints
                collectionView.snp.removeConstraints()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let dimension = view.frame.width / 5
        return CGSize(width: dimension - 2, height: dimension)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId1", for: indexPath)
        cell.backgroundColor = .brown
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId2", for: indexPath)
        cell.backgroundColor = .brown
        return cell
    }
    
}















