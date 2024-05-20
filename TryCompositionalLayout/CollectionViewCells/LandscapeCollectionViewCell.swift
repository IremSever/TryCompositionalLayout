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
        setupUI()
    }
    
    func setupUI() {
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    func setup(_ item: ListItem) {
        imgLandscape.image = UIImage(named: item.image)
        lblLandcape.text = item.title
    }

}
