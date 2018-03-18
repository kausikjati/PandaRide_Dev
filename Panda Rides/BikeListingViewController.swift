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

enum vehicle : String {
    case car = "C"
    case bike = "B"
}

class BikeListingViewController: UIViewController, DateTimePickerDelegate {
    @IBOutlet weak var loadingLbl: UILabel!
    @IBOutlet weak var bikeLoader: UIView!
    @IBOutlet weak var menuTable: UITableView!
    @IBOutlet weak var bikeTable: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    var picker: DateTimePicker?
    var selectedIndexvalue: Int = 0
    @IBOutlet weak var menuVIew: NSLayoutConstraint!
    @IBOutlet weak var menuView_: UIView!
   // @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var stackview: UIView!
    @IBOutlet weak var lineLblLeading: NSLayoutConstraint!
    @IBOutlet weak var lineLBL: UILabel!
    
    var menu_array = [MenuItem]()
    var bike = [Bike]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationController?.navigationBar.isHidden = true
        
        //navBar.barTintColor = self.navigationController?.navigationBar.barTintColor
        //navBar.barStyle = self.navigationController?.navigationBar.barStyle
        //stackview.backgroundColor = self.navigationController?.navigationBar.backgroundColor
        
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
        
     self.apiCall(for: .bike)
       
            
       
    }
    
    
    func apiCall(for type : vehicle) -> Void
    {
        
        self.bike.removeAll()
        self.bikeTable.reloadData()
        
        bikeLoader.isHidden = false
        
        if type == .car
        {
            loadingLbl.text = "Loading Cars..."
        }
        else
        {
             loadingLbl.text = "Loading Bikes..."
        }
        
       
        
        APIManager.sharedInstance.getBikelisting(for: bikeListing, parameters:["type" : type.rawValue]) {[weak self] (json, error) in
            
            self?.bikeLoader.isHidden = true
            
            if let json_obj = json
            {
                let data = json_obj["data"]["listing"]
                
                for item in data
                {
                    let bike = Bike(BikeJson: item.1)
                    self?.bike.append(bike)
                    
                }
                
                self?.bikeTable.reloadData()
            }
            else
            {
                self?.bikeLoader.isHidden = false
                self?.loadingLbl.text = error?.localizedDescription
            }
            
        }
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
    
    @IBAction func bikeORcar(_ sender: UIButton) {
        
        
        
        lineLblLeading.constant = sender.frame.origin.x
        
        UIView.animate(withDuration: 0.2, animations: {
            self.stackview.layoutIfNeeded()
        })
       
        if sender.tag == 0 {
            
            
            self.apiCall(for: .bike)
            
        }
        else
        {
            self.apiCall(for: .car)
        }
        
        print(lineLblLeading.constant)
        print(lineLBL.frame.size.width)
        
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
            return bike.count
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
        //bikeCell.mainView.dropShadow(color: .black, opacity: 0.3, offSet: CGSize(width: -0.5, height: 1), radius: 3, scale: true)
            
        let bike = self.bike[indexPath.row]
        bikeCell.bikeName.text = bike.name
        
            if bike.location.count > 0
            {
                
                bikeCell.location_lbl.text = bike.location[0]
                
            }
            
        
        bikeCell.info_lbl.text = "\(bike.hour_cost)₹ for a Hour OR \(bike.day_cost)₹ for a Day"
        
        bikeCell.bikeImage.loadImageAsync(with: bike.image)
            
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
            
            let menu_item = self.menu_array[indexPath.row].title ?? ""
            
            switch menu_item
            {
            case "Tariff":
                let bikelisting_obj = self.storyboard?.instantiateViewController(withIdentifier: "tarrif") as! TarrifViewController
                self.navigationController?.pushViewController(bikelisting_obj, animated: true)
                
                break
                
                
            default:
                
                
                let bikelisting_obj = self.storyboard?.instantiateViewController(withIdentifier: "contact") as! ContactTableViewController
                self.navigationController?.pushViewController(bikelisting_obj, animated: true)
            }
            
            
        }
        else
        {
            
            
            
            
            let bikelisting_obj = self.storyboard?.instantiateViewController(withIdentifier: "details") as! DetailsViewController
            bikelisting_obj.bike = self.bike[indexPath.row]
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





