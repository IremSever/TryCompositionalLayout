//
//  ListSection.swift
//  TryCompositionalLayout
//
//  Created by IREM SEVER on 17.05.2024.
//

import Foundation

enum ListSection {
    case stories([ListItem])
    case popular([ListItem])
    case comingSoon([ListItem])
    case trends([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .stories(let items),
             .popular(let items),
             .comingSoon(let items),
             .trends(let items):
            return items
        }
    }
    
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self {
        case .stories:
            return "Stories"
        case .popular:
            return "Popular"
        case .comingSoon:
            return "Coming Soon"
        case .trends:
            return "Trends"
        }
        
    }
}
