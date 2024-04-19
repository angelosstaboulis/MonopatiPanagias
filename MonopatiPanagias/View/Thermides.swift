//
//  Thermides.swift
//  MonopatiPanagias
//
//  Created by Angelos Staboulis on 19/4/24.
//

import SwiftUI
import MapKit
struct Thermides: View {
    @State var lastname:String
    @State var firstname:String
    @State var result:Double!=0.0
    @State var getResult:Double!=0.0
    @State var weight:String
    @State var distance:String
    var body: some View {
        VStack{
            Text("Επώνυμο").frame(width:420,height:45,alignment: .leading)
            TextField("Εισάγετε το επώνυμο σας", text:$lastname)
            Text("Ονομα").frame(width:420,height:45,alignment: .leading)
            TextField("Εισάγετε το ονομα σας", text:$firstname)
            Text("Βάρος").frame(width:420,height:45,alignment: .leading)
            TextField("Εισάγετε το βάρος σας", text:$weight)
            Text("Απόσταση").frame(width:420,height:45,alignment: .leading)
            TextField("Εισάγετε την απόσταση", text:$distance)
            Button {
                getResult = returnResult()
            } label: {
                Text("Υπολογισμός Θερμίδων")
            }.padding(15)
            Text("Θερμίδες="+String(format:"%.2f",getResult))
            Map{
                Marker(coordinate: CLLocationCoordinate2D(latitude: 41.0856069822, longitude: 25.2847143344)) {
                    Text("Μονή Βαθυρύακος,Κομοτηνή")
                }
            }.navigationTitle("Υπ.Θερμίδων")
                .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    func returnResult()->Double{
        result = Double(weight)!*Double(distance)!*1.036
        return result
    }
}

#Preview {
    Thermides(lastname: "", firstname: "", weight: "", distance: "")
}
