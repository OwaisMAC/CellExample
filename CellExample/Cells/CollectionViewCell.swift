//
//  CollectionViewCell.swift
//  CellExample
//
//  Copyright © 2019 The Dev. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionCellLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionCellLabel.layer.cornerRadius = collectionCellLabel.frame.width/2
        collectionCellLabel.clipsToBounds = true
    }
    
}
