//
//  Cell.swift
//  CellExample
//
//  Copyright © 2019 The Dev. All rights reserved.
//

import UIKit

protocol CellUpdateDelegate {
    func cellUpdated(text:String)
}

class TableViewCell: UITableViewCell {

    var delegate:CellUpdateDelegate?
    var previousIndexPath:IndexPath!
    var selectedIndexPath:IndexPath!
    var dataArray:[String]!
    var colorArray:[UIColor]!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconsView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setupData()
        self.iconsView.delegate = self
        self.iconsView.dataSource = self
        self.iconsView.reloadData()
    }
    func setupData(){
        selectedIndexPath = IndexPath(item: 0, section: 0)
        dataArray = ["A","F","G","L","Q","I","D","C","W"]
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}

extension TableViewCell:UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionCell:CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell(frame: .zero)
        }
        collectionCell.collectionCellLabel.text = dataArray[indexPath.row]
        collectionCell.collectionCellLabel.backgroundColor = (selectedIndexPath == indexPath ? UIColor.blue : UIColor.gray)
        return collectionCell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        previousIndexPath = selectedIndexPath
        selectedIndexPath = indexPath
        delegate?.cellUpdated(text: dataArray[indexPath.row])
        guard previousIndexPath != selectedIndexPath else { return }
        iconsView.reloadItems(at: [previousIndexPath,selectedIndexPath])
    }
    
    
}
