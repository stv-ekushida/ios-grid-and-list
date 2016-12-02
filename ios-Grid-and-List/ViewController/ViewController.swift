//
//  ViewController.swift
//  GridAndListDemo
//
//  Created by Kushida　Eiji on 2016/09/12.
//  Copyright © 2016年 Kushida　Eiji. All rights reserved.
//

import UIKit

enum ViewType {
    case grid
    case list
}

class ViewController: UIViewController {
    
    @IBOutlet weak var typeSegmentControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let gridFlowLayout = GridFlowLayout()
    let listFlowLayout = ListFlowLayout()
    let dataSource = ListCollectionViewDataSource()
    
    var fileNames = [String]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    //セグメントコントロールで表示形式を切り替えます
    @IBAction func didTapType(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case ViewType.grid.hashValue:
            updateView(flowLayout: gridFlowLayout)
            break
            
        case ViewType.list.hashValue:
            updateView(flowLayout: listFlowLayout)
            break
            
        default:
            break
        }
    }
    
    fileprivate func setup() {
        
        setupTestData()
        setupListView()
    }
    
    fileprivate func setupTestData() {

        for i in 1...10 {
            fileNames.append("\(i)")
        }
        dataSource.update(fileNames: fileNames)
    }
    
    fileprivate func setupListView() {
        collectionView.dataSource = dataSource
        collectionView.collectionViewLayout = gridFlowLayout
    }
    
    //Viewを切り替えます
    fileprivate func updateView(flowLayout: UICollectionViewFlowLayout) {
        
        UIView.animate(withDuration: 0.2) { [weak self] () -> Void in
            self?.collectionView.collectionViewLayout.invalidateLayout()
            self?.collectionView.setCollectionViewLayout(flowLayout, animated: true)
        }
    }
}
