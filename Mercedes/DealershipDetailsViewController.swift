//
//  DealershipDetailsViewController.swift
//  Mercedes
//
//  Created by Kiprop Korir on 23/04/2019.
//  Copyright © 2019 Kiprop Korir. All rights reserved.
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
        if let url = URL(string: "TEL://\(dealership?.phone ?? "0000"))"),
            UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler:nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        } else {
            // add error message here
        }
    }
}
