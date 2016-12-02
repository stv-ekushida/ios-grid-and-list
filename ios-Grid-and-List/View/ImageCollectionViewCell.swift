//
//  ImageCollectionViewCell.swift
//  GridAndListDemo
//
//  Created by Kushida　Eiji on 2016/09/12.
//  Copyright © 2016年 Kushida　Eiji. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    static var identifier: String {
        get {
            return String(describing: self)
        }
    }
}
