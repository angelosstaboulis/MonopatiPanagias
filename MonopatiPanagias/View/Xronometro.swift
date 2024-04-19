//
//  Xronometro.swift
//  MonopatiPanagias
//
//  Created by Angelos Staboulis on 19/4/24.
//

import SwiftUI
import MapKit
struct Xronometro: View {
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var hour:Int
    @State var minute:Int
    @State var seconds:Int
    @State var hourShow:String
    @State var minuteShow:String
    @State var secondsShow:String
    @State var stopped:Bool
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text(String(describing:hour)+":").font(.largeTitle)
                    Text(minuteShow+":").font(.largeTitle)
                    Text(secondsShow).font(.largeTitle)
                    
                }
                VStack{
                    Button(action: {
                        stopped.toggle()
                        if stopped{
                            stopTimer()
                        }else{
                             startTimer()
                        }
                    }, label: {
                        Text(stopped ? "Start" : "Stop")
                    })
                }
                Map{
                    Marker(coordinate: CLLocationCoordinate2D(latitude: 41.0856069822, longitude: 25.2847143344)) {
                        Text("Μονή Βαθυρύακος,Κομοτηνή")
                    }
                }
            }
        }.onReceive(timer, perform: { _ in
            if seconds == 59 {
                if  minute >= 59 {
                     hour = hour + 1
                     hourShow = String(hour)
                     minute = 0
                     seconds = 0
                }
                else{
                    minute = minute + 1
                    if minute>=0 && minute <= 9 {
                        minuteShow = "0" + String(minute)
                    }
                    else{
                        minuteShow = String(minute)
                        hourShow = String(hour)
                    }
                    
                }
                 seconds = 0
                 secondsShow = "0" + String(seconds)
             }
             else{
                 seconds = seconds + 1
                 if minute>=0 && minute <= 9 {
                     minuteShow =  "0"+String(minute)
                 }else{
                     minuteShow =  String(minute)
                    
                 }
                 if seconds <= 9 {
                     secondsShow = "0" + String(seconds)
                 }
                 else{
                     secondsShow =  String(seconds)
                 }
                 
             }
           
        }).navigationTitle("Χρονόμετρο")
        .navigationBarTitleDisplayMode(.inline)
        
    }
    func startTimer(){
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }
    func stopTimer(){
        timer.upstream.connect().cancel()
    }
}

#Preview {
    Xronometro(hour: 0, minute: 0, seconds: 0,hourShow: "",minuteShow: "",secondsShow: "", stopped: false)
}
