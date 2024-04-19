//
//  ListNews.swift
//  MonopatiPanagias
//
//  Created by Angelos Staboulis on 19/4/24.
//

import SwiftUI

struct ListNews: View {
    @StateObject var viewModel = ViewModelMonopati()
    @State var news:[RSSFeedMonopati] = []
    var body: some View {
        NavigationStack{
            List(news,id:\.self){item in
                HStack{
                    VStack{
                        Image("background").resizable()
                    }.frame(width:100,height:95)
                    Link(destination: URL(string:item.link)!) {
                        Text(item.title)
                    }
                }
                
            }.onAppear(perform: {
                Task{
                    news.append(contentsOf: await viewModel.fetchRSS())
                }
            }).listStyle(.plain)
        }
    }
}

#Preview {
    ListNews()
}
