//
//  ViewController.swift
//  MyWeather
//
//  Created by mac on 2022/6/26.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON
import Foundation

let frame = UIScreen.main.bounds
let ScreenWidth = frame.width
let ScreenHeight = frame.height

var cityid = ""

class ViewController: UIViewController, CLLocationManagerDelegate, QueryViewControllerDelegate{
    
    
    @IBOutlet weak var cityname: UILabel!
    @IBOutlet weak var tempnum: UILabel!
    @IBOutlet weak var tempicon: UIImageView!
    @IBOutlet weak var temptext: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var windDir: UILabel!
    @IBOutlet weak var windScale: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var vis: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    let locationManager = CLLocationManager()
    let weather = Weather()
    
    lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView(frame: frame)
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.image = UIImage(named: "bg")
        return backgroundImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
     
        setupView()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.requestLocation()
        
        tableView.isScrollEnabled = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(Cell.self, forCellReuseIdentifier: identifier)
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    func setupView(){
        self.view.addSubview(backgroundImage)
        self.view.sendSubviewToBack(backgroundImage)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lon = locations[0].coordinate.longitude
        let lat = locations[0].coordinate.latitude

        AF.request(kQWeatherNowPath,parameters: getParameters("\(lon),\(lat)")).responseJSON
        { response in
            if let data = response.value{
                let weatherJSON = JSON(data)
                self.weather.humidity = "\(weatherJSON["now","humidity"].stringValue)"
                self.weather.pressure = "\(weatherJSON["now","pressure"].stringValue)"
                self.weather.tempicon = weatherJSON["now","icon"].stringValue
                self.weather.tempnum = "\(weatherJSON["now","temp"].stringValue)"
                self.weather.temptext = "\(weatherJSON["now","text"].stringValue)"
                self.weather.windSpeed = "\(weatherJSON["now","windSpeed"].stringValue)"
                self.weather.windScale = "\(weatherJSON["now","windScale"].stringValue)"
                self.weather.windDir = "\(weatherJSON["now","windDir"].stringValue)"
                self.weather.vis = "\(weatherJSON["now","vis"].stringValue)"

                self.cityname.text = self.weather.cityname
                self.humidity.text = self.weather.humidity
                self.pressure.text = self.weather.pressure
                self.vis.text = self.weather.vis
                self.windDir.text = self.weather.windDir
                self.windScale.text = self.weather.windScale
                self.windSpeed.text = self.weather.windSpeed
                self.tempnum.text = self.weather.tempnum
                self.temptext.text = self.weather.temptext
                self.tempicon.image = UIImage(named: self.weather.tempicon)
            }
        }

        AF.request(kQWeatherCityPath,parameters: getParameters("\(lon),\(lat)")).responseJSON
        { response in
            if let data = response.value{
                let cityJSON = JSON(data)
                self.weather.cityname = cityJSON["location",0,"adm2"].stringValue
                self.cityname.text = self.weather.cityname
                cityid = cityJSON["location",0,"id"].string!
                
                
                AF.request("https://v0.yiketianqi.com/api?unescape=1&version=v62&appid=97621528&appsecret=XX2c6G6X&cityid=\(cityid)").responseJSON
                { response in
                    if let data = response.value{
                        let hourJSON = JSON(data)
                        self.weather.json = hourJSON
                        self.tableView.reloadData()
                    }
                }
            }
        }
        
       
        
    }
    
    func getp(_ location: String) -> [String: String] {
        ["location" : location]
    }
    
    func getParameters(_ location: String) -> [String: String]{
        ["location": location,"key": kQWeatherWebKey]
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        temptext.text = "获取位置失败"
    }
    func didChangeCity(city: String) {
        
        AF.request(kQWeatherCityPath,parameters: getParameters(city)).responseJSON{
            response in
            if let data = response.value{
                let cityJSON = JSON(data)
//                print(cityJSON)
                self.weather.cityname = cityJSON["location",0,"adm2"].stringValue
                self.cityname.text = self.weather.cityname
                
                let cityID = cityJSON["location",0,"id"].stringValue
                cityid = cityID
                
                AF.request("https://v0.yiketianqi.com/api?unescape=1&version=v62&appid=97621528&appsecret=XX2c6G6X&cityid=\(cityid)").responseJSON
                { response in
                    if let data = response.value{
                        let hourJSON = JSON(data)
                        print(hourJSON)
                        self.weather.json = hourJSON
                        self.tableView.reloadData()
                    }
                }
                AF.request(kQWeatherNowPath,parameters: self.getParameters(cityID)).responseJSON { response in
                    if let data = response.value{
                        let weatherJSON = JSON(data)
                        self.weather.humidity = "\(weatherJSON["now","humidity"].stringValue)"
                        self.weather.pressure = "\(weatherJSON["now","pressure"].stringValue)"
                        self.weather.tempicon = weatherJSON["now","icon"].stringValue
                        self.weather.tempnum = "\(weatherJSON["now","temp"].stringValue)"
                        self.weather.temptext = "\(weatherJSON["now","text"].stringValue)"
                        self.weather.windSpeed = "\(weatherJSON["now","windSpeed"].stringValue)"
                        self.weather.windScale = "\(weatherJSON["now","windScale"].stringValue)"
                        self.weather.windDir = "\(weatherJSON["now","windDir"].stringValue)"
                        self.weather.vis = "\(weatherJSON["now","vis"].stringValue)"

                        self.cityname.text = self.weather.cityname
                        self.humidity.text = self.weather.humidity
                        self.pressure.text = self.weather.pressure
                        self.vis.text = self.weather.vis
                        self.windDir.text = self.weather.windDir
                        self.windScale.text = self.weather.windScale
                        self.windSpeed.text = self.weather.windSpeed
                        self.tempnum.text = self.weather.tempnum
                        self.temptext.text = self.weather.temptext
                        self.tempicon.image = UIImage(named: self.weather.tempicon)
        //                print(weatherJSON["now","temp"])
                    }
                    
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
//        if segue.identifier == "QueryViewControllerSegue"{
//            let vc = segue.destination as! QueryViewController
//            vc.currentCity = weather.city
        
//        }
    
        segue.destination.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        if let vc = segue.destination as? QueryViewController{
            vc.currentCity = weather.cityname
            vc.delegate = self
        }
        else if let vc = segue.destination as? SevenDaysViewController{
            vc.cityid = cityid
            vc.city = weather.cityname
        }
    }

    
}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 23
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        weather.index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! Cell
        
        cell.selectionStyle = .none
        
       
        cell.layer.cornerRadius = 20
        cell.backgroundColor = .clear
        weather.hour = self.weather.json["hours",indexPath.row,"hours"].stringValue
        cell.time.text = weather.hour
        
        cell.date.text = self.weather.json["date"].stringValue
    
        cell.temp.text = self.weather.json["tem1"].stringValue
        
        cell.temp1.text = self.weather.json["tem2"].stringValue
        
        cell.wth.text = self.weather.json["hours",indexPath.row,"wea"].stringValue
        
        return cell
    }
    
}
