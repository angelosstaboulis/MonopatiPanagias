//
//  Diadromi.swift
//  MonopatiPanagias
//
//  Created by Angelos Staboulis on 19/4/24.
//

import SwiftUI
import MapKit
struct Diadromi: View {
    @State var destinationCoordinates:CLLocationCoordinate2D
    @State var currentCoordinates:CLLocationCoordinate2D
    @State var current:String
    @State var distance:String
    @State var realDistance:String
    var body: some View {
        NavigationStack {
            VStack{
                VStack{
                    Text("Παρακαλώ εισάγετε το μέρος το οποίο βρισκόσαστε").frame(width:430,height:45,alignment: .leading)
                    TextField("Παρακαλώ εισάγετε το μέρος το οποίο βρισκόσαστε", text: $current)
                }
                VStack{
                    Text("Απόσταση =\(realDistance)").frame(width:430,height:45,alignment: .leading)
                }
                HStack{
                    VStack{
                        Button(action: {
                            Task{
                                currentCoordinates = await Helper.shared.getCoordinates(destinationValue: current)
                                destinationCoordinates = CLLocationCoordinate2D(latitude: 41.0814809, longitude: 25.2482816)
                                distance = String(format:"%.2fkm",Helper.shared.getDistance(currentCoordinates: currentCoordinates, destinationCoordinates: destinationCoordinates))
                                
                                realDistance = await Helper.shared.getRealDistance(currentCoordinates: currentCoordinates, destinationCoordinates: destinationCoordinates)
                            }
                        }, label: {
                            Text("Πήγαινε με")
                        })
                    }
                    
                }.frame(width:430,height:45,alignment: .trailing)
                Map{
                    Marker(coordinate: destinationCoordinates) {
                        Text("Μονή Βαθυρύακος,Κομοτηνή")
                    }
                }.navigationTitle("Υπ.Διαδρομής")
                    .navigationBarTitleDisplayMode(.inline)
            }
            
        }
    }
}

#Preview {
    Diadromi(destinationCoordinates: .init(), currentCoordinates: .init(), current: "", distance: "", realDistance: "")
}
