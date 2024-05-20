//
//  CompositionalLayout.swift
//  TryCompositionalLayout
//
//  Created by IREM SEVER on 17.05.2024.
//

import Foundation
import UIKit

enum CompositionalGroupAligment {
    case vertical
    case horizontal
}

struct CompositionalLayout {
    static func createItem(width: NSCollectionLayoutDimension, height: NSCollectionLayoutDimension, spacing: CGFloat) -> NSCollectionLayoutItem {
        
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height))
        item.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        
        return item
    }
    
    static func createGroup(alignment: CompositionalGroupAligment,
                            width: NSCollectionLayoutDimension,
                            height: NSCollectionLayoutDimension,
                            items: [NSCollectionLayoutItem]) -> NSCollectionLayoutGroup {
        switch alignment {
        case .vertical:
            return NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: width, 
                                                                                       heightDimension: height),
                                                    subitems: items)
        case .horizontal:
            return NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: width, 
                                                                                         heightDimension: height),
                                                                                         subitems: items)
        }
    }
    
    static func createGroup(alignment: CompositionalGroupAligment,
                            width: NSCollectionLayoutDimension,
                            height: NSCollectionLayoutDimension,
                            item: NSCollectionLayoutItem,
                            count: Int) -> NSCollectionLayoutGroup {
        switch alignment {
        case .vertical:
            return NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: width, 
                                                                                       heightDimension: height),
                                                    subitems: item,
                                                    )
        case .horizontal:
            return NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: width, 
                                                                                         heightDimension: height),
                                                      subitems: item)
        }
    }

}
