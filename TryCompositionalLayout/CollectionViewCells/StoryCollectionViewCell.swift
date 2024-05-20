//
//  StoryCollectionViewCell.swift
//  TryCompositionalLayout
//
//  Created by IREM SEVER on 20.05.2024.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "StoryCollectionViewCell"
    @IBOutlet weak var imgStory: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        imgStory.layer.borderWidth = 1.0
        imgStory.layer.borderColor = UIColor.lightGray.cgColor
    }

    func setup(_ item: ListItem) {
        imgStory.image = UIImage(named: item.image)
        imgStory.layoutIfNeeded()
        imgStory.layer.cornerRadius = imgStory.frame.height / 2
    }
}
