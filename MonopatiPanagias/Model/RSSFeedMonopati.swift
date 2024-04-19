//
//  RSSFeedMonopati.swift
//  MonopatiPanagias
//
//  Created by Angelos Staboulis on 18/4/24.
//

import Foundation
struct RSSFeedMonopati:Hashable{
    var title:String
    var link:String
    var pubdate:Date
    init(title:String,link:String,pubDate:Date) {
        self.title = title
        self.link = link
        self.pubdate = pubDate
    }
    func hash(into hasher: inout Hasher) {
        
    }
}
