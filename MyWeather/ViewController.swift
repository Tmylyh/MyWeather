//
//  ViewController.swift
//  MyWeather
//
//  Created by mac on 2022/6/26.
//

import UIKit
import CoreLocation

let frame = UIScreen.main.bounds
let ScreenWidth = frame.width
let ScreenHeight = frame.height



class ViewController: UIViewController, CLLocationManagerDelegate{
    
    let locationManager = CLLocationManager()
    
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
        
    }
}
