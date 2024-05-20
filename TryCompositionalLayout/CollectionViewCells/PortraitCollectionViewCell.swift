//
//  PortraitCollectionViewCell.swift
//  TryCompositionalLayout
//
//  Created by IREM SEVER on 20.05.2024.
//

import UIKit

class PortraitCollectionViewCell: UICollectionViewCell {
    static let identifier = "PortraitCollectionViewCell"
    @IBOutlet weak var lblPortrait: UILabel!
    @IBOutlet weak var imgPortrait: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
    }
    
    func setup(_ item: ListItem){
        imgPortrait.image = UIImage(named: item.image)
        lblPortrait.text = item.title
    }

}
