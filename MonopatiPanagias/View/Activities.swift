//
//  Activities.swift
//  MonopatiPanagias
//
//  Created by Angelos Staboulis on 19/4/24.
//

import SwiftUI

struct Activities: View {
    @State var items = ["Λεπτομέρειες-Προκήρυξη","Υπολογισμός Διαδρομής","Υπ.Θερμίδων","Χρονόμετρο"]
    var body: some View {
        NavigationStack {
            List($items,id:\.self){item in
                NavigationLink {
                    if item.wrappedValue == "Λεπτομέρειες-Προκήρυξη"{
                        VStack{
                            WebVideo(urlVideo: "https://ierapostolimk.gr/?page_id=2292")
                        }
                    }
                    if item.wrappedValue == "Υπ.Θερμίδων"{
                        Thermides(lastname: "", firstname: "", weight: "", distance: "")
                    }
                    if item.wrappedValue == "Υπολογισμός Διαδρομής"{
                        Diadromi(destinationCoordinates: .init(), currentCoordinates:.init(), current: "", distance: "", realDistance: "")
                    }
                    if item.wrappedValue == "Χρονόμετρο"{
                        Xronometro(hour: 0, minute: 0, seconds: 0,hourShow: "",minuteShow: "",secondsShow: "", stopped: false)
                    }
                } label: {
                    Text(item.wrappedValue)
                }

            }.listStyle(.plain)
        }
        
    }
}

#Preview {
    Activities()
}
