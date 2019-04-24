//
//  DealershipDetailsViewController.swift
//  Mercedes
//
//  Created by Sami Rehman on 23/04/2019.
//  Copyright © 2019 Sami Rehman. All rights reserved.
//

import UIKit
import MapKit

class DealershipDetailsViewController: UIViewController {
    @IBOutlet weak var ivDealership: UIImageView!
    
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTimes: UILabel!
    @IBOutlet weak var btnMaps: UIButton!
    
    @IBOutlet weak var btnCall: UIButton!
    var dealership: Dealership? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Dealership"

        lblName.text = dealership?.name
        lblLocation.text = "Location: \(dealership?.location ?? "")"
        lblTimes.text = "Opens from: \(dealership?.opening_times ?? "")"
        ivDealership.sd_setImage(with: Foundation.URL(string: dealership?.image_url ?? ""), placeholderImage: #imageLiteral(resourceName: "placeholder"))
        btnCall.setTitle( "CALL THEM AT \(dealership?.phone ?? "")", for: UIControl.State.normal)
    }
  
    @IBAction func seeMapLocation(_ sender: Any) {
        
        if (dealership?.longitude!.isEmpty)! || dealership?.longitude == "" || (dealership?.latitude!.isEmpty)! || dealership?.latitude == "" {
            
        }
        else {
             openMaps()
        }
    }
    
    @IBAction func callDealership(_ sender: Any) {
        
        if let number = dealership?.phone {
            number.makeAColl()
        }
    }
}







extension DealershipDetailsViewController {
    
    
    func openMaps(){
        
        let currentLocationLatitude = dealership?.latitude
        let currentLocationLongitude = dealership?.longitude

        let latitude  = Double(currentLocationLatitude!)
        let longitude  = Double(currentLocationLongitude!)
        
        let regionDistance : CLLocationDistance = 1000
    
    
        let coorrdinate = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
    
        let regionSpan =  MKCoordinateRegion.init(center: coorrdinate, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey:NSValue(mkCoordinate: regionSpan.center),MKLaunchOptionsMapSpanKey:NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placeMark = MKPlacemark(coordinate: coorrdinate)
        
        let mapItem = MKMapItem(placemark: placeMark)
        
        mapItem.name = dealership?.name ?? "Mercedez Benz"
        
        mapItem.openInMaps(launchOptions: options)
        
    }
    
}





extension String {
    
    enum RegularExpressions: String {
        case phone = "^\\s*(?:\\+?(\\d{1,3}))?([-. (]*(\\d{3})[-. )]*)?((\\d{3})[-. ]*(\\d{2,4})(?:[-.x ]*(\\d+))?)\\s*$"
    }
    
    func isValid(regex: RegularExpressions) -> Bool {
        return isValid(regex: regex.rawValue)
    }
    
    func isValid(regex: String) -> Bool {
        let matches = range(of: regex, options: .regularExpression)
        return matches != nil
    }
    
    func onlyDigits() -> String {
        let filtredUnicodeScalars = unicodeScalars.filter{CharacterSet.decimalDigits.contains($0)}
        return String(String.UnicodeScalarView(filtredUnicodeScalars))
    }
    
    func makeAColl() {
        if isValid(regex: .phone) {
            if let url = URL(string: "tel://\(self.onlyDigits())"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
}
