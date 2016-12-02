//
//  ListCollectionViewDataSource.swift
//  GridAndListDemo
//
//  Created by Kushida　Eiji on 2016/12/02.
//  Copyright © 2016年 Kushida　Eiji. All rights reserved.
//

import UIKit

final class ListCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    var fileNames: [String] = []
    
    func update(fileNames: [String]) {
        self.fileNames = fileNames
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fileNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier,
                                                      for: indexPath as IndexPath) as! ImageCollectionViewCell
        
        cell.imageView.image = UIImage(named: "\(fileNames[indexPath.row])"+".jpg")
        return cell
    }
}
