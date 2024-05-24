//
//  ViewController.swift
//  TryCompositionalLayout
//
//  Created by IREM SEVER on 16.05.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    private let sections = AppData.shared.pageData
    private var maxHeight: CGFloat = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        collectionView.collectionViewLayout = createLayout()
    }
    
    func registerCells() {
        collectionView.register(UINib(nibName: "StoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
        collectionView.register(UINib(nibName: "TrendsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: TrendsCollectionViewCell.identifier)
        collectionView.register(UINib(nibName: "PortraitCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PortraitCollectionViewCell.identifier)
        collectionView.register(UINib(nibName: "LandscapeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: LandscapeCollectionViewCell.identifier)
        collectionView.register(UINib(nibName: "HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            guard let self = self else {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)), subitems: [item])
                return NSCollectionLayoutSection(group: group)
            }
            let section = self.sections[sectionIndex]
            switch section {
            case .stories:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(80), heightDimension: .absolute(80)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 0, leading: 0, bottom: 10, trailing: 0)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                return section
            case .popular:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.85), heightDimension: .fractionalHeight(0.6)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 0, leading: 0, bottom: 10, trailing: 0)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                return section
            case .comingSoon:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(200), heightDimension: .absolute(60)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 0, leading: 0, bottom: 10, trailing: 0)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                return section
            case .trends:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(maxHeight > 0 ? maxHeight : 100)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(maxHeight > 0 ? maxHeight : 100)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 0, leading: 0, bottom: 10, trailing: 0)
                section.contentInsetsReference = .layoutMargins
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                let decorationItem = NSCollectionLayoutDecorationItem.background(elementKind: "background")
                section.decorationItems = [decorationItem]
                return section
            }
        }
        
        layout.register(BackgroundDecorationView.self, forDecorationViewOfKind: "background")
        return layout
    }
    
    func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
    
    class BackgroundDecorationView: UICollectionReusableView {
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.backgroundColor = UIColor(red: 154/255, green: 205/255, blue: 50/255, alpha: 0.5)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, TrendsCollectionViewCellDelegate {
    func didCalculateCellHeight(height: CGFloat) {
        if maxHeight == 0 {
            maxHeight = height
        } else if height > maxHeight {
            maxHeight = height
            collectionView.collectionViewLayout.invalidateLayout()
        }
        //print("****************************", maxHeight)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
        case .stories(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as! StoryCollectionViewCell
            cell.setup(items[indexPath.row])
            return cell
        case .popular(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PortraitCollectionViewCell.identifier, for: indexPath) as! PortraitCollectionViewCell
            
            cell.setup(items[indexPath.row])
            return cell
        case .comingSoon(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LandscapeCollectionViewCell.identifier, for: indexPath) as! LandscapeCollectionViewCell
            cell.setup(items[indexPath.row])
            return cell
        case .trends(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendsCollectionViewCell.identifier, for: indexPath) as! TrendsCollectionViewCell
            cell.setup(items[indexPath.row])
            cell.delegate = self
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
            header.setup(sections[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
}
