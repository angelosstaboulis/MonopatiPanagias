//
//  ContentView.swift
//  MonopatiPanagias
//
//  Created by Angelos Staboulis on 18/4/24.
//

import SwiftUI
struct ContentView: View {
    @State var showHide:Bool
    var body: some View {
        VStack {
            VStack(alignment:.leading){
                Button(action: {
                    showHide.toggle()
                }) {
                    Image("menu")
                }
                VStack{
                    Image("background")
                        .resizable()
                        .foregroundStyle(.tint).overlay {
                            VStack{
                                showHide ? AnyView(SideMenu(clicked: "", showHide: showHide)) : AnyView(EmptyView())
                            }.frame(maxWidth:.infinity,alignment: .leading)
                               
                        }
                }.padding(1.0)
                    .frame(maxWidth: UIScreen.main.bounds.width * 1.7,
                        maxHeight: UIScreen.main.bounds.height,
                        alignment: .topLeading)
            }.frame(maxWidth: UIScreen.main.bounds.width,
                    maxHeight: UIScreen.main.bounds.height,
                    alignment: .topLeading)
           
        }
        
    }
}

#Preview {
    ContentView(showHide: false)
}
