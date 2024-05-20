//
//  ListSection.swift
//  TryCompositionalLayout
//
//  Created by IREM SEVER on 17.05.2024.
//

import Foundation

enum ListSection {
    case stories([ListItem])
    case trends([ListItem])
    case comingSoon([ListItem])
    case popular([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .stories(let items),
             .trends(let items),
             .comingSoon(let items),
             .popular(let items):
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
        case .trends:
            return "Trends"
        case .comingSoon:
            return "Coming Soon"
        case .popular:
            return "Popular"
        }
        
    }
}
