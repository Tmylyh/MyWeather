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



class ViewController: UIViewController, CLLocationManagerDelegate{
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
            }
        }
    }
    
    func getParameters(_ location: String) -> [String: String]{
        ["location": location,"key": kQWeatherWebKey]
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        temptext.text = "获取位置失败"
    }
}
