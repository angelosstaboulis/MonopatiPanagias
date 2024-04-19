//
//  Helper.swift
//  MonopatiPanagias
//
//  Created by Angelos Staboulis on 19/4/24.
//

import Foundation
import MapKit
class Helper{
    static let shared = Helper()
    private init(){}
    func getCoordinates(destinationValue:String) async -> CLLocationCoordinate2D{
        return await withCheckedContinuation{contiuation in
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(destinationValue) { placermark, error in
                guard let destination = placermark else{
                    return
                }
                guard let findDestination = destination.last else{
                    return
                }
                guard let findCordinate = findDestination.location else{
                    return
                }
                contiuation.resume(returning: findCordinate.coordinate)
            }
        }
       
    }
    func getDistance(currentCoordinates:CLLocationCoordinate2D,destinationCoordinates:CLLocationCoordinate2D)->CLLocationDistance{
        let currentLocation = CLLocation(latitude:currentCoordinates.latitude , longitude: currentCoordinates.longitude)
        let destinationLocation = CLLocation(latitude:destinationCoordinates.latitude , longitude: destinationCoordinates.longitude)
        let distance = destinationLocation.distance(from: currentLocation)
        return distance / 1000
    }
    func getRealDistance(currentCoordinates:CLLocationCoordinate2D,destinationCoordinates:CLLocationCoordinate2D) async -> String{
        return await withCheckedContinuation{continuation in
                let request = MKDirections.Request()
                request.source = MKMapItem(placemark: .init(coordinate: currentCoordinates))
                request.destination = MKMapItem(placemark: .init(coordinate: destinationCoordinates))
                request.transportType = .automobile
                let calculateDistance = MKDirections(request: request)
                calculateDistance.calculate { response, error in
                    guard let routeResponse = response else {
                        return
                    }
                    guard let route = routeResponse.routes.first else {
                        return
                    }
                    continuation.resume(returning: String(format:"%.0fkm",route.distance/1000))
                }
               
        }
       
    }
}
