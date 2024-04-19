//
//  Mitropoli.swift
//  MonopatiPanagias
//
//  Created by Angelos Staboulis on 18/4/24.
//

import SwiftUI
import MapKit
struct Mitropoli: View {
    @State var coordinates = CLLocationCoordinate2D(latitude: 41.116690, longitude: 25.400430)
    var body: some View {
        NavigationStack{
            Map{
                Marker("Μητοόπολη Μαρωνείας και Κομοτηνής", coordinate: coordinates)
            }
        }.frame(maxWidth:UIScreen.main.bounds.width,
                    maxHeight: UIScreen.main.bounds.height,
                    alignment: .topLeading)
    }
}

#Preview {
    Mitropoli()
}
