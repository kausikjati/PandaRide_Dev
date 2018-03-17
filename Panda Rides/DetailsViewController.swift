//
//  DetailsViewController.swift
//  Panda Rides
//
//  Created by Kausik Jati on 01/03/18.
//  Copyright © 2018 Kausik Jati. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

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
            return 4
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
            
                return bikeCell
            
            }
            else
            {
                let infocell = tableView.dequeueReusableCell(withIdentifier: "info") as! DetailsInfoTableViewCell
                infocell.description_lbl.text = "Bagnan , Kolkata , Westbengal , 711303 It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to usingBagnan , Kolkata , Westbengal , 711303 It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to usingBagnan , Kolkata , Westbengal , 711303 It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to usingBagnan , Kolkata , Westbengal , 711303 It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to usingBagnan , Kolkata , Westbengal , 711303 It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using"
            
                return infocell
            }
            
        }
        else
            {
                let locationCell = tableView.dequeueReusableCell(withIdentifier: "location") as! LocationTableViewCell
                locationCell.selectionStyle = .none
                
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
                self.title = "KTM 390"
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    
}
