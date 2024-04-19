//
//  Contact.swift
//  MonopatiPanagias
//
//  Created by Angelos Staboulis on 18/4/24.
//

import SwiftUI

struct Contact: View {
    @State var items = ["Μητρόπολη Μαρωνείας και Κομοτηνής","Γραφείο Ιεραποστολής","Επικοινωνία"]
    var body: some View {
        NavigationStack {
            List(items,id:\.self){item in
                NavigationLink {
                    if item == "Μητρόπολη Μαρωνείας και Κομοτηνής"{
                        Mitropoli()
                    }
                    if item == "Γραφείο Ιεραποστολής"{
                        Ierapostoli()
                    }
                    if item == "Επικοινωνία"{
                        Galanakis()
                    }
                    
                } label: {
                    Text(item)
                }
            }.listStyle(.plain)
               
        }.frame(maxWidth:UIScreen.main.bounds.width,
                 maxHeight: UIScreen.main.bounds.height,
                 alignment: .leading)
       
        
        
    }
}

#Preview {
    Contact()
}
