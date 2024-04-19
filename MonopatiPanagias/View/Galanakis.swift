//
//  Galanakis.swift
//  MonopatiPanagias
//
//  Created by Angelos Staboulis on 18/4/24.
//

import SwiftUI
import MapKit
struct Galanakis: View {
    @State var coordinates = CLLocationCoordinate2D(latitude: 41.119340, longitude: 25.395770)
    var body: some View {
        NavigationStack{
            Map{
                Marker("Επικοινωνία - Β.Γαλανάκης", coordinate: coordinates)
            }
        }.frame(maxWidth:UIScreen.main.bounds.width,
                    maxHeight: UIScreen.main.bounds.height,
                    alignment: .topLeading)
    }
}

#Preview {
    Galanakis()
}
