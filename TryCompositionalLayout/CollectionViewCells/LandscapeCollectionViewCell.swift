//
//  LandscapeCollectionViewCell.swift
//  TryCompositionalLayout
//
//  Created by IREM SEVER on 20.05.2024.
//

import UIKit

class LandscapeCollectionViewCell: UICollectionViewCell {
    static let identifier = "LandscapeCollectionViewCell"
    @IBOutlet weak var lblLandcape: UILabel!
    @IBOutlet weak var imgLandscape: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(_ item: ListItem) {
        imgLandscape.image = UIImage(named: item.image)
        lblLandcape.text = item.title
    }

}
