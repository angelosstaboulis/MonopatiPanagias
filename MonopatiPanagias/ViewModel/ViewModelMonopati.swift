//
//  ViewModelMonopati.swift
//  MonopatiPanagias
//
//  Created by Angelos Staboulis on 18/4/24.
//

import Foundation
class ViewModelMonopati:ObservableObject{
    func fetchRSS() async -> [RSSFeedMonopati]{
        return await withCheckedContinuation { continuation in
            Task{
                continuation.resume(returning: await APIManager.shared.fetchRssFeed())
            }
        }
    }
}
