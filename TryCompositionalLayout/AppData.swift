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
        .stories([.init(title: "", image: "story*1", date: "", description: ""),
                  .init(title: "", image: "story*2", date: "", description: ""),
                  .init(title: "", image: "story*3", date: "", description: ""),
                  .init(title: "", image: "story*4", date: "", description: ""),
                  .init(title: "", image: "story*5", date: "", description: ""),
                  .init(title: "", image: "story*6", date: "", description: ""),
                  .init(title: "", image: "story*7", date: "", description: ""),
                  .init(title: "", image: "story*8", date: "", description: "")])
    }()
    
    private let popular: ListSection = {
        .popular([.init(title: "Pool in the Courtyard", image: "popular*5", date: "", description: ""),
                  .init(title: "Postmodern Architecture", image: "popular*4", date: "", description: ""),
                  .init(title: "Modern Architecture", image: "popular*3", date: "", description: ""),
                  .init(title: "Inside", image: "popular*1", date: "", description: ""),
                  .init(title: "Outside", image: "popular*2", date: "", description: "")])
    }()
    
    private let comingSoon: ListSection = {
        .comingSoon([.init(title: "Water x Villa", image: "soon*1", date: "", description: ""),
                     .init(title: "Minimalist Architecture", image: "soon*2", date: "", description: ""),
                     .init(title: "Villa in the Nature", image: "soon*3", date: "", description: ""),
                     .init(title: "Landscape", image: "soon*4", date: "", description: ""),
                     .init(title: "Modern Airport", image: "soon*5", date: "", description: "")])
    }()
    
    private let trends: ListSection = {
        .trends([.init(title: "Baroque Architecture", image: "baroque", date: "18.05.2023",
                        description: "The Baroque is a highly ornate and elaborate style of architecture, art and design that flourished in Europe in the 17th and first half of the 18th century. Originating in Italy, its influence quickly spread across Europe and it became the first visual style to have a significant worldwide impact."),
                  .init(title: "Renaissance Architecture", image: "Renaissance architecture", date: "12.05.2024",
                        description: "Renaissance Architecture originated in Italy and superseded the Gothic style over a period generally defined as 1400 to 1600. Features of Renaissance buildings include the use of the classical orders and mathematically precise ratios of height and width combined with a desire for symmetry, proportion, and harmony"),
                  .init(title: "Neoclassical Architecture", image: "neoclassical", date: "01.04.2024",
                        description: "Neoclassical architecture is characterized by grandeur of scale, simplicity of geometric forms, Greek—especially Doric (see order)—or Roman detail, dramatic use of columns, and a preference for blank walls. The new taste for antique simplicity represented a general reaction to the excesses of the Rococo style."),
                  .init(title: "Beaux-Arts", image: "Beaux-Arts-Architecture", date: "12.03.2024",
                        description: "Beaux-Arts architecture was the academic architectural style taught at the École des Beaux-Arts in Paris, particularly from the 1830s to the end of the 19th century. It drew upon the principles of French neoclassicism, but also incorporated Renaissance and Baroque elements, and used modern materials, such as iron and glass, and later, steel. It was an important style and enormous influence in Europe and the Americas through the end of the 19th century, and into the 20th, particularly for the institutional buildings."),
                  .init(title: "Deconstructivism", image: "Deconstructivism", date: "06.01.2024",
                        description: "November 2023) Deconstructivism is a postmodern architectural movement which appeared in the 1980s. It gives the impression of the fragmentation of the constructed building, commonly characterised by an absence of obvious harmony, continuity, or symmetry."),
                  .init(title: "Gothic Architecture", image: "gothic", date: "26.12.2023",
                        description: "Gothic architecture, architectural style in Europe that lasted from the mid-12th century to the 16th century, particularly a style of masonry building characterized by cavernous spaces with the expanse of walls broken up by overlaid tracery."),
                  .init(title: "Brutalist Architecture", image: "Brutalist architecture", date: "09.12.2023",
                        description: "Brutalism is a style of architecture that lasted from the 1950s to the 1970s, characterized by simple, block-like, hulking concrete structures. Emerging from the modernist movement of the late 19th century to the mid-20th century, it originated in England and spread to the rest of the world shortly after. It's an offshoot of modernism. Brutalist buildings are popular locations in films and television series about urban dystopias."),
                  .init(title: "Modern Architecture", image: "modern architecture", date: "05.11.2023",
                        description: "Modern architecture is the architectural style that dominated the Western world between the 1930s and the 1960s and was characterized by an analytical and functional approach to building design. Buildings in the style are often defined by flat roofs, open floor plans, curtain windows, and minimal ornamentation."),
                  .init(title: "Art Deco", image: "art deco", date: "24.08.2023",
                        description: "Art deco is an art movement originating from France. After the 1920s, it was seen especially in the field of architecture. It took its name from the Exposition Internationale des Arts Décoratifs et Industriels Modernes exhibition held in 1925.")])
    }()
    
    var pageData: [ListSection] {
        [stories, popular, comingSoon, trends]
    }
}
