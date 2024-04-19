//
//  SideMenu.swift
//  MonopatiPanagias
//
//  Created by Angelos Staboulis on 18/4/24.
//

import SwiftUI

struct SideMenu: View {
    @State var items = ["Νέα","Δραστηριότητες","Επικοινωνία"]
    @State var clicked:String
    @State var calcWidth = UIScreen.main.bounds.width / 1.7
    @State var showHide:Bool
    var body: some View {
        NavigationStack {
            List(items, id: \.self) { item in
                NavigationLink {
                    if item == "Νέα" {
                        ListNews().onAppear(perform: {
                            calcWidth = UIScreen.main.bounds.width
                        }).navigationBarBackButtonHidden()
                            .toolbar{
                                ToolbarItem(placement: .navigation) {
                                    Button {
                                        calcWidth = 0
                                    } label: {
                                        HStack{
                                            Image(systemName:"arrow.left")
                                            Text("Back")
                                            
                                        }
                                    }
                                    
                                }
                            }
                    }
                    if item == "Επικοινωνία"{
                        Contact().onAppear(perform: {
                            calcWidth = UIScreen.main.bounds.width
                        }).navigationBarBackButtonHidden()
                            .toolbar{
                                ToolbarItem(placement: .navigation) {
                                    Button {
                                        calcWidth = 0
                                    } label: {
                                        HStack{
                                            Image(systemName:"arrow.left")
                                            Text("Back")
                                            
                                        }
                                    }
                                    
                                }
                            }
                    }
                    if item == "Δραστηριότητες"{
                        Activities().onAppear(perform: {
                            calcWidth = UIScreen.main.bounds.width
                        }).navigationBarBackButtonHidden()
                            .toolbar{
                                ToolbarItem(placement: .navigation) {
                                    Button {
                                        calcWidth = 0
                                    } label: {
                                        HStack{
                                            Image(systemName:"arrow.left")
                                            Text("Back")
                                            
                                        }
                                    }
                                    
                                }
                            }
                    }
                } label: {
                    Text(item)
                }
                
            }.listStyle(.plain)
            
            
        }.frame(maxWidth:calcWidth,
                maxHeight: UIScreen.main.bounds.height,
                alignment: .topLeading)
        
        
    }
}

#Preview {
    SideMenu(clicked: "", showHide: false)
}
