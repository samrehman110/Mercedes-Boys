//
//  DealershipDetailsViewController.swift
//  Mercedes
//
//  Created by Sami Rehman on 23/04/2019.
//  Copyright © 2019 Sami Rehman. All rights reserved.
//

import UIKit

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
        guard let url = URL(string: dealership?.location ?? "") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func callDealership(_ sender: Any) {
        guard let number = URL(string: "telprompt://\(dealership?.phone ?? ""))") else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(number)
        } else {
            // Fallback on earlier versions
            UIApplication.shared.openURL(number)
        }
    }
}
