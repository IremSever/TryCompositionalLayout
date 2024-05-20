//
//  TrendsCollectionViewCell.swift
//  TryCompositionalLayout
//
//  Created by IREM SEVER on 20.05.2024.
//

import UIKit

class TrendsCollectionViewCell: UICollectionViewCell {

    static let identifier = "TrendsCollectionViewCell"
    
    @IBOutlet weak var lblDescriptionTrends: UILabel!
    @IBOutlet weak var lblDateTrends: UILabel!
    @IBOutlet weak var lblTitleTrends: UILabel!
    @IBOutlet weak var imgTrends: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func setup(_ item: ListItem) {
        imgTrends.image = UIImage(named: item.image)
        lblTitleTrends.text = item.title
        lblDateTrends.text = item.date
        lblDescriptionTrends.text = item.description
    }

}