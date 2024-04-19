//
//  APIManager.swift
//  MonopatiPanagias
//
//  Created by Angelos Staboulis on 18/4/24.
//

import Foundation
import Alamofire
import AlamofireRSSParser
class APIManager{
    static let shared = APIManager()
    private init(){}
    func fetchRssFeed() async -> [RSSFeedMonopati]{
        return await withCheckedContinuation { continuation in
            let url = "https://ierapostolimk.gr/?feed=rss2#"
            AF.request(url).responseRSS() { (response) -> Void in
                do{
                    let feed: RSSFeed = try response.result.get()
                    var getFeed=[RSSFeedMonopati]()
                    for item in feed.items {
                        getFeed.append(RSSFeedMonopati(title: item.title!, link: item.link!, pubDate: item.pubDate!))
                    }
                    continuation.resume(returning: getFeed)
                    
                }catch{
                    debugPrint("something went wrong"+error.localizedDescription)
                }
            }
        }
        
    }
    
}
