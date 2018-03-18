//
//  DetailsViewController.swift
//  Panda Rides
//
//  Created by Kausik Jati on 01/03/18.
//  Copyright © 2018 Kausik Jati. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var bike : Bike? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Details"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension DetailsViewController: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0
        {
           return 2
        }
        else
        {
            return bike?.location.count ?? 0
        }
        
    
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
       
        if indexPath.section == 0
        {
            if indexPath.row == 0
            {
            return 183
            }
            else
            {
            return UITableViewAutomaticDimension
            }
        }
        else
        {
            return 30
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0
        {
            if indexPath.row == 0
            {
                return 183
            }
            else
            {
                return UITableViewAutomaticDimension
            }
        }
        else
        {
            return UITableViewAutomaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0
        {
        
            if indexPath.row == 0
            {
                let bikeCell = tableView.dequeueReusableCell(withIdentifier: "image") as! DetailsImageTableViewCell
                bikeCell.selectionStyle = .none
                bikeCell.image_view.loadImageAsync(with: bike?.image)
            
                return bikeCell
            
            }
            else
            {
                let infocell = tableView.dequeueReusableCell(withIdentifier: "info") as! DetailsInfoTableViewCell
                infocell.description_lbl.text = bike?.description
                infocell.name_lbl.text = bike?.name
                infocell.price_day.text = "Price per day :\(bike?.day_cost ?? "0")₹"
                infocell.price_hours.text = "Price per hour :\(bike?.hour_cost ?? "0")₹"
            
                return infocell
            }
            
        }
        else
            {
                let locationCell = tableView.dequeueReusableCell(withIdentifier: "location") as! LocationTableViewCell
                locationCell.selectionStyle = .none
                locationCell.location.text = bike?.location[indexPath.row]
                return locationCell
            }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
       if indexPath.section == 0
       {
            if indexPath.row == 0
            {
                self.title = "Details"
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0
        {
            if indexPath.row == 0
            {
                self.title = bike?.name
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    
}
