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
        // Initialization code
    }
    
    
    func setup(_ item: ListItem){
        imgPortrait.image = UIImage(named: item.image)
        lblPortrait.text = item.title
    }

}
