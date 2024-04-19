//
//  Ierapostoli.swift
//  MonopatiPanagias
//
//  Created by Angelos Staboulis on 18/4/24.
//

import SwiftUI
import MapKit
struct Ierapostoli: View {
    @State var coordinates = CLLocationCoordinate2D(latitude: 41.114950, longitude: 25.400760)
    var body: some View {
        NavigationStack{
            Map{
                Marker("Γραφεία Ιεραποστολής", coordinate: coordinates)
            }
        }.frame(maxWidth:UIScreen.main.bounds.width,
                    maxHeight: UIScreen.main.bounds.height,
                    alignment: .topLeading)
    }
}

#Preview {
    Ierapostoli()
}
