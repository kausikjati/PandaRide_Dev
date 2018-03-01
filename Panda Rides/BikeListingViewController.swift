//
//  BikeListingViewController.swift
//  Panda Rides
//
//  Created by Kausik Jati on 01/03/18.
//  Copyright © 2018 Kausik Jati. All rights reserved.
//

import UIKit


struct MenuItem
{
    let title : String?
    let image : UIImage?
}

class BikeListingViewController: UIViewController, DateTimePickerDelegate {
    @IBOutlet weak var menuTable: UITableView!
    @IBOutlet weak var bikeTable: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    var picker: DateTimePicker?
    var selectedIndexvalue: Int = 0
    @IBOutlet weak var menuVIew: NSLayoutConstraint!
    @IBOutlet weak var menuView_: UIView!
    
    var menu_array = [MenuItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationController?.navigationBar.isHidden = true
        
        menu_array = [MenuItem(title: "Bike Listing", image: #imageLiteral(resourceName: "ic_view_quilt")),
                          MenuItem(title: "Tariff", image: #imageLiteral(resourceName: "ic_view_quilt")),
                          MenuItem(title: "Contact us", image: #imageLiteral(resourceName: "ic_view_quilt")),
                          MenuItem(title: "About us", image: #imageLiteral(resourceName: "ic_view_quilt")),
                          MenuItem(title: "Terms and Conditions", image: #imageLiteral(resourceName: "ic_view_quilt")),
                          MenuItem(title: "Faq", image: #imageLiteral(resourceName: "ic_view_quilt"))]
        
 
        
        self.title = "RIDES AVAILABLE"
        menuTable.tableFooterView = UIView()
        
        let menuBtn = UIButton.init(type: .system)
        menuBtn.setImage(#imageLiteral(resourceName: "menu"), for: .normal)
        menuBtn.frame = CGRect.init(x: 0, y: 0, width: 34, height: 30)
        menuBtn.addTarget(self, action: #selector(self.menu), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: menuBtn)
        
        
        let filterBtn = UIButton.init(type: .system)
        filterBtn.setImage(#imageLiteral(resourceName: "icons8-slider-50"), for: .normal)
        filterBtn.frame = CGRect.init(x: 0, y: 0, width: 34, height: 30)
        filterBtn.addTarget(self, action: #selector(self.filter), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: filterBtn)

        // Do any additional setup after loading the view.
        
        bikeTable.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillDisappear(_ animated: Bool) {
        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = item
    }
    @objc func filter(sender:UIButton)
    {
        let filterVC = self.storyboard?.instantiateViewController(withIdentifier: "filter") as! FilterTableViewController
        let navigationVC = UINavigationController(rootViewController: filterVC)
        navigationVC.navigationBar.tintColor = self.navigationController?.navigationBar.tintColor
        self.present(navigationVC, animated: true, completion: nil)
    }
    
    @objc func menu(sender:UIButton)
    {
        print("menu")
        
        if menuVIew.constant == 0
        {
            UIView.animate(withDuration: 0.2, animations: {
                
                self.menuVIew.constant = -230
                self.view.layoutIfNeeded()
            })
            
        }
        else
        {
            UIView.animate(withDuration: 0.2, animations: {
                
                self.menuVIew.constant = 0
                self.view.layoutIfNeeded()
            })
            
        }
        
        
    }
    
    @IBAction func selectDate(_ sender: UISegmentedControl) {
        
        
        let min = Date()
        let max = min.addingTimeInterval(29*60*60*24)
        let picker = DateTimePicker.show(selected: Date(), minimumDate: min, maximumDate: max)
        picker.timeInterval = DateTimePicker.MinuteInterval.thirty
        picker.highlightColor = UIColor(red: 15.0/255.0, green: 88.0/255.0, blue: 161.0/255.0, alpha: 1)
        picker.darkColor = UIColor.darkGray
        picker.doneButtonTitle = "DONE"
        picker.doneBackgroundColor = UIColor(red: 15.0/255.0, green: 88.0/255.0, blue: 161.0/255.0, alpha: 1)
        picker.locale = Locale(identifier: "en_GB")
        
        picker.todayButtonTitle = "Today"
        picker.is12HourFormat = true
        picker.dateFormat = "dd-MMM-YYYY hh:mm aa"
        //        picker.isTimePickerOnly = true
        picker.includeMonth = true // if true the month shows at top
        picker.completionHandler = { date in
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MMM-YYYY hh:mm aa"
            
            if self.selectedIndexvalue == 0
            {
                self.segment.setTitle(formatter.string(from: date), forSegmentAt: self.selectedIndexvalue)
                self.segment.setTitle("Check Out Date", forSegmentAt: 1)
                self.segment.isEnabledForSegment(at: 1)
            }
            else
            {
                self.segment.setTitle(formatter.string(from: date), forSegmentAt: self.selectedIndexvalue)
                self.segment.selectedSegmentIndex = UISegmentedControlNoSegment
                
            }
        }
        picker.delegate = self
        self.picker = picker
        
        
       
        
        selectedIndexvalue = sender.selectedSegmentIndex
        
    }
    
    func dateTimePicker(_ picker: DateTimePicker, didSelectDate: Date) {
        
        
        
//        if selectedIndexvalue == 0
//        {
//        segment.setTitle(picker.selectedDateString, forSegmentAt: selectedIndexvalue)
//        segment.setTitle("Check Out Date", forSegmentAt: 1)
//        segment.isEnabledForSegment(at: 1)
//        }
//        else
//        {
//             segment.setTitle(picker.selectedDateString, forSegmentAt: selectedIndexvalue)
//
//        }
        
        
//        segment.selectedSegmentIndex = UISegmentedControlNoSegment
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

extension BikeListingViewController: UITableViewDelegate , UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView.tag == 0
        {
            return 20
        }
        else
        {
            return menu_array.count
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if tableView.tag == 0
        {
            return UITableViewAutomaticDimension
        }
        else
        {
            return 70
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        if tableView.tag == 0
        {
            return UITableViewAutomaticDimension
        }
        else
        {
            return 70
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView.tag == 0
        {
        let bikeCell = tableView.dequeueReusableCell(withIdentifier: "bikeinfo") as! BikeTableViewCell
        bikeCell.mainView.layer.cornerRadius = 5
        bikeCell.mainView.dropShadow(color: .black, opacity: 0.3, offSet: CGSize(width: -0.5, height: 1), radius: 3, scale: true)
        bikeCell.location_lbl.text = "Bagnan , Kolkata , Westbengal , 711303"
        bikeCell.info_lbl.text = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using"
        
        bikeCell.selectionStyle = .none
        
        return bikeCell
       
        }
        else
        {
            let menu_cell = tableView.dequeueReusableCell(withIdentifier: "menu") as! MenuTableViewCell
            menu_cell.option_lbl.text = menu_array[indexPath.row].title
            return menu_cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if tableView.tag == 1
        {
            
            let bikelisting_obj = self.storyboard?.instantiateViewController(withIdentifier: "contact") as! ContactTableViewController
            self.navigationController?.pushViewController(bikelisting_obj, animated: true)
        }
        else
        {
            let bikelisting_obj = self.storyboard?.instantiateViewController(withIdentifier: "details") as! DetailsViewController
            self.navigationController?.pushViewController(bikelisting_obj, animated: true)
        }
    }
    
}


extension UIView {
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}





