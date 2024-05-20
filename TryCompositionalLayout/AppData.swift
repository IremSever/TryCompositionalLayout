//
//  AppData.swift
//  TryCompositionalLayout
//
//  Created by IREM SEVER on 17.05.2024.
//

import Foundation

struct AppData {
    static let shared = AppData()
    
    private let stories: ListSection = {
        .stories([.init(title: "", image: "story*1"),
                  .init(title: "", image: "story*2"),
                  .init(title: "", image: "story*3"),
                  .init(title: "", image: "story*4"),
                  .init(title: "", image: "story*5"),
                  .init(title: "", image: "story*6"),
                  .init(title: "", image: "story*7"),
                  .init(title: "", image: "story*8")])
    }()
    
    private let popular: ListSection = {
        .popular([.init(title: "Pool in the Courtyard", image: "popular*5"),
                  .init(title: "Postmodern Architecture", image: "popular*4"),
                  .init(title: "ModernVilla", image: "popular*3"),
                  .init(title: "Inside", image: "popular*1"),
                  .init(title: "Outside", image: "popular*2")])
    }()
    
    private let comingSoon: ListSection = {
        .comingSoon([.init(title: "Water x Villa", image: "soon*1"),
                     .init(title: "Minimalist Architecture", image: "soon*2"),
                     .init(title: "Villa in the Nature", image: "soon*3"),
                     .init(title: "Landscape", image: "soon*4"),
                     .init(title: "Modern Airport", image: "soon*5")])
    }()
    
    var pageData: [ListSection] {
        [stories, popular, comingSoon]
    }
}
