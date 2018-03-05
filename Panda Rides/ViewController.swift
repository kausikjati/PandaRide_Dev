//
//  ViewController.swift
//  Panda Rides
//
//  Created by Kausik Jati on 25/02/18.
//  Copyright © 2018 Kausik Jati. All rights reserved.
//

import UIKit

class ViewController: UIViewController   {
    @IBOutlet weak var register_lbl: UILabel!
    @IBOutlet weak var sigIn_btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        //navigationController?.navigationBar.shadowImage = UIImage()
        
        //Register tap
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapFunction))
        register_lbl.isUserInteractionEnabled = true
        register_lbl.addGestureRecognizer(tap)
        
        sigIn_btn.layer.cornerRadius = 5
        sigIn_btn.clipsToBounds = true
    }
    
    @IBAction func skip(_ sender: UIButton) {
        
        
        let bikelisting_obj = self.storyboard?.instantiateViewController(withIdentifier: "bikelisting") as! BikeListingViewController
        self.navigationController?.pushViewController(bikelisting_obj, animated: true)
        
    }
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        print("tap working")
        
        let register_obj = self.storyboard?.instantiateViewController(withIdentifier: "register") as! RegisterViewController
        self.navigationController?.pushViewController(register_obj, animated: true)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillDisappear(_ animated: Bool) {
        
        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = item
    }

}

 

