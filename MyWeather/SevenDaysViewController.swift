//
//  SevenDaysViewController.swift
//  MyWeather
//
//  Created by mac on 2022/6/28.
//

import UIKit
import Alamofire
import SwiftyJSON

class SevenDaysViewController: UIViewController, UIScrollViewDelegate {
    var city = ""
    var cityid = ""
    var day = ""
    var weatherlabelmorning = ""
    var daysJSON:JSON = ""
    @IBAction func bac(_ sender: Any) {
        dismiss(animated: true)
    }
    let scroll = UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenFrame = UIScreen.main.bounds
        let screenWidth = screenFrame.size.width
        let screenHeight = screenFrame.self.height
        
        let cityname = UILabel(frame: CGRect(x: screenWidth / 2 - 30, y: 55, width: 100, height: 50))
        cityname.font = UIFont(name: "Arial", size: 36)
        cityname.textAlignment = .left
        cityname.textColor = .white
        cityname.text = city
        
        
        
        scroll.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        scroll.contentSize = CGSize(width: screenWidth * 4, height: screenHeight)
        scroll.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        self.view.addSubview(cityname)
        self.view.addSubview(scroll)
        self.view.sendSubviewToBack(scroll)
        // Do any additional setup after loading the view.
        

        AF.request("https://v0.yiketianqi.com/api?unescape=1&version=v9&appid=97621528&appsecret=XX2c6G6X&cityid=\(cityid)").responseJSON
        { response in
            if let data = response.value{
                let daysJSON = JSON(data)
                self.daysJSON = daysJSON
                print(daysJSON)
                
                let date = UILabel(frame: CGRect(x: 10, y: 175, width: 200, height: 80))
                date.font = UIFont(name: "Arial", size: 24)
                date.textAlignment = .left
                date.textColor = .white
                date.text = daysJSON["data",0,"day"].stringValue
                self.scroll.addSubview(date)
                
                let date2 = UILabel(frame: CGRect(x: 250, y: 175, width: 200, height: 80))
                date2.font = UIFont(name: "Arial", size: 24)
                date2.textAlignment = .left
                date2.textColor = .white
                date2.text = daysJSON["data",1,"day"].stringValue
                self.scroll.addSubview(date2)
                
                let date3 = UILabel(frame: CGRect(x: 490, y: 175, width: 200, height: 80))
                date3.font = UIFont(name: "Arial", size: 24)
                date3.textAlignment = .left
                date3.textColor = .white
                date3.text = daysJSON["data",2,"day"].stringValue
                self.scroll.addSubview(date3)
                
                let date4 = UILabel(frame: CGRect(x: 730, y: 175, width: 200, height: 80))
                date4.font = UIFont(name: "Arial", size: 24)
                date4.textAlignment = .left
                date4.textColor = .white
                date4.text = daysJSON["data",3,"day"].stringValue
                self.scroll.addSubview(date4)
                
                let date5 = UILabel(frame: CGRect(x: 970, y: 175, width: 200, height: 80))
                date5.font = UIFont(name: "Arial", size: 24)
                date5.textAlignment = .left
                date5.textColor = .white
                date5.text = daysJSON["data",4,"day"].stringValue
                self.scroll.addSubview(date5)
                
                let date6 = UILabel(frame: CGRect(x: 1210, y: 175, width: 200, height: 80))
                date6.font = UIFont(name: "Arial", size: 24)
                date6.textAlignment = .left
                date6.textColor = .white
                date6.text = daysJSON["data",5,"day"].stringValue
                self.scroll.addSubview(date6)
                
                let date7 = UILabel(frame: CGRect(x: 1450, y: 175, width: 200, height: 80))
                date7.font = UIFont(name: "Arial", size: 24)
                date7.textAlignment = .left
                date7.textColor = .white
                date7.text = daysJSON["data",6,"day"].stringValue
                self.scroll.addSubview(date7)
                
                let wea1 = UILabel(frame: CGRect(x: 10, y: 225, width: 100, height: 80))
                wea1.font = UIFont(name: "Arial", size: 24)
                wea1.textAlignment = .left
                wea1.textColor = .white
                wea1.text = daysJSON["data",0,"wea_day"].stringValue
                self.scroll.addSubview(wea1)
                
                let wea2 = UILabel(frame: CGRect(x: 250, y: 225, width: 100, height: 80))
                wea2.font = UIFont(name: "Arial", size: 24)
                wea2.textAlignment = .left
                wea2.textColor = .white
                wea2.text = daysJSON["data",1,"wea_day"].stringValue
                self.scroll.addSubview(wea2)
                
                let wea3 = UILabel(frame: CGRect(x: 490, y: 225, width: 100, height: 80))
                wea3.font = UIFont(name: "Arial", size: 24)
                wea3.textAlignment = .left
                wea3.textColor = .white
                wea3.text = daysJSON["data",2,"wea_day"].stringValue
                self.scroll.addSubview(wea3)
                
                let wea4 = UILabel(frame: CGRect(x: 730, y: 225, width: 100, height: 80))
                wea4.font = UIFont(name: "Arial", size: 24)
                wea4.textAlignment = .left
                wea4.textColor = .white
                wea4.text = daysJSON["data",3,"wea_day"].stringValue
                self.scroll.addSubview(wea4)
                
                let wea5 = UILabel(frame: CGRect(x: 970, y: 225, width: 100, height: 80))
                wea5.font = UIFont(name: "Arial", size: 24)
                wea5.textAlignment = .left
                wea5.textColor = .white
                wea5.text = daysJSON["data",4,"wea_day"].stringValue
                self.scroll.addSubview(wea5)
                
                let wea6 = UILabel(frame: CGRect(x: 1210, y: 225, width: 100, height: 80))
                wea6.font = UIFont(name: "Arial", size: 24)
                wea6.textAlignment = .left
                wea6.textColor = .white
                wea6.text = daysJSON["data",5,"wea_day"].stringValue
                self.scroll.addSubview(wea6)
                
                let wea7 = UILabel(frame: CGRect(x: 1450, y: 225, width: 100, height: 80))
                wea7.font = UIFont(name: "Arial", size: 24)
                wea7.textAlignment = .left
                wea7.textColor = .white
                wea7.text = daysJSON["data",6,"wea_day"].stringValue
                self.scroll.addSubview(wea7)
                
                let temp1 = UILabel(frame: CGRect(x: 100, y: 225, width: 100, height: 80))
                temp1.font = UIFont(name: "Arial", size: 24)
                temp1.textAlignment = .left
                temp1.textColor = .white
                temp1.text = daysJSON["data",0,"tem1"].stringValue
                self.scroll.addSubview(temp1)
                
                let temp2 = UILabel(frame: CGRect(x: 340, y: 225, width: 100, height: 80))
                temp2.font = UIFont(name: "Arial", size: 24)
                temp2.textAlignment = .left
                temp2.textColor = .white
                temp2.text = daysJSON["data",1,"tem1"].stringValue
                self.scroll.addSubview(temp2)
                
                let temp3 = UILabel(frame: CGRect(x: 580, y: 225, width: 100, height: 80))
                temp3.font = UIFont(name: "Arial", size: 24)
                temp3.textAlignment = .left
                temp3.textColor = .white
                temp3.text = daysJSON["data",2,"tem1"].stringValue
                self.scroll.addSubview(temp3)
                
                let temp4 = UILabel(frame: CGRect(x: 820, y: 225, width: 100, height: 80))
                temp4.font = UIFont(name: "Arial", size: 24)
                temp4.textAlignment = .left
                temp4.textColor = .white
                temp4.text = daysJSON["data",3,"tem1"].stringValue
                self.scroll.addSubview(temp4)
                
                let temp5 = UILabel(frame: CGRect(x: 1060, y: 225, width: 100, height: 80))
                temp5.font = UIFont(name: "Arial", size: 24)
                temp5.textAlignment = .left
                temp5.textColor = .white
                temp5.text = daysJSON["data",4,"tem1"].stringValue
                self.scroll.addSubview(temp5)
                
                let temp6 = UILabel(frame: CGRect(x: 1300, y: 225, width: 100, height: 80))
                temp6.font = UIFont(name: "Arial", size: 24)
                temp6.textAlignment = .left
                temp6.textColor = .white
                temp6.text = daysJSON["data",5,"tem1"].stringValue
                self.scroll.addSubview(temp6)
                
                let temp7 = UILabel(frame: CGRect(x: 1540, y: 225, width: 100, height: 80))
                temp7.font = UIFont(name: "Arial", size: 24)
                temp7.textAlignment = .left
                temp7.textColor = .white
                temp7.text = daysJSON["data",6,"tem1"].stringValue
                self.scroll.addSubview(temp7)
                
                let du = UILabel(frame: CGRect(x: 130, y: 225, width: 30, height: 80))
                du.font = UIFont(name: "Arial", size: 24)
                du.textAlignment = .left
                du.textColor = .white
                du.text = "°C"
                self.scroll.addSubview(du)
                
                let du2 = UILabel(frame: CGRect(x: 370, y: 225, width: 30, height: 80))
                du2.font = UIFont(name: "Arial", size: 24)
                du2.textAlignment = .left
                du2.textColor = .white
                du2.text = "°C"
                self.scroll.addSubview(du2)
                
                let du3 = UILabel(frame: CGRect(x: 610, y: 225, width: 30, height: 80))
                du3.font = UIFont(name: "Arial", size: 24)
                du3.textAlignment = .left
                du3.textColor = .white
                du3.text = "°C"
                self.scroll.addSubview(du3)
                
                let du4 = UILabel(frame: CGRect(x: 850, y: 225, width: 30, height: 80))
                du4.font = UIFont(name: "Arial", size: 24)
                du4.textAlignment = .left
                du4.textColor = .white
                du4.text = "°C"
                self.scroll.addSubview(du4)
                
                let du5 = UILabel(frame: CGRect(x: 1090, y: 225, width: 30, height: 80))
                du5.font = UIFont(name: "Arial", size: 24)
                du5.textAlignment = .left
                du5.textColor = .white
                du5.text = "°C"
                self.scroll.addSubview(du5)
                
                let du6 = UILabel(frame: CGRect(x: 1330, y: 225, width: 30, height: 80))
                du6.font = UIFont(name: "Arial", size: 24)
                du6.textAlignment = .left
                du6.textColor = .white
                du6.text = "°C"
                self.scroll.addSubview(du6)
                
                let du7 = UILabel(frame: CGRect(x: 1570, y: 225, width: 30, height: 80))
                du7.font = UIFont(name: "Arial", size: 24)
                du7.textAlignment = .left
                du7.textColor = .white
                du7.text = "°C"
                self.scroll.addSubview(du7)
                
                let weat = UILabel(frame: CGRect(x: 10, y: 325, width: 100, height: 80))
                weat.font = UIFont(name: "Arial", size: 24)
                weat.textAlignment = .left
                weat.textColor = .white
                weat.text = daysJSON["data",0,"wea_night"].stringValue
                self.scroll.addSubview(weat)
                
                let weat2 = UILabel(frame: CGRect(x: 250, y: 325, width: 100, height: 80))
                weat2.font = UIFont(name: "Arial", size: 24)
                weat2.textAlignment = .left
                weat2.textColor = .white
                weat2.text = daysJSON["data",1,"wea_night"].stringValue
                self.scroll.addSubview(weat2)
                
                let weat3 = UILabel(frame: CGRect(x: 490, y: 325, width: 100, height: 80))
                weat3.font = UIFont(name: "Arial", size: 24)
                weat3.textAlignment = .left
                weat3.textColor = .white
                weat3.text = daysJSON["data",2,"wea_night"].stringValue
                self.scroll.addSubview(weat3)
                
                let weat4 = UILabel(frame: CGRect(x: 730, y: 325, width: 100, height: 80))
                weat4.font = UIFont(name: "Arial", size: 24)
                weat4.textAlignment = .left
                weat4.textColor = .white
                weat4.text = daysJSON["data",3,"wea_night"].stringValue
                self.scroll.addSubview(weat4)
                
                let weat5 = UILabel(frame: CGRect(x: 970, y: 325, width: 100, height: 80))
                weat5.font = UIFont(name: "Arial", size: 24)
                weat5.textAlignment = .left
                weat5.textColor = .white
                weat5.text = daysJSON["data",4,"wea_night"].stringValue
                self.scroll.addSubview(weat5)
                
                let weat6 = UILabel(frame: CGRect(x: 1210, y: 325, width: 100, height: 80))
                weat6.font = UIFont(name: "Arial", size: 24)
                weat6.textAlignment = .left
                weat6.textColor = .white
                weat6.text = daysJSON["data",5,"wea_night"].stringValue
                self.scroll.addSubview(weat6)
                
                let weat7 = UILabel(frame: CGRect(x: 1450, y: 325, width: 100, height: 80))
                weat7.font = UIFont(name: "Arial", size: 24)
                weat7.textAlignment = .left
                weat7.textColor = .white
                weat7.text = daysJSON["data",6,"wea_night"].stringValue
                self.scroll.addSubview(weat7)
                
                let templ = UILabel(frame: CGRect(x: 100, y: 325, width: 100, height: 80))
                templ.font = UIFont(name: "Arial", size: 24)
                templ.textAlignment = .left
                templ.textColor = .white
                templ.text = daysJSON["data",0,"tem2"].stringValue
                self.scroll.addSubview(templ)
                
                let templ2 = UILabel(frame: CGRect(x: 340, y: 325, width: 100, height: 80))
                templ2.font = UIFont(name: "Arial", size: 24)
                templ2.textAlignment = .left
                templ2.textColor = .white
                templ2.text = daysJSON["data",1,"tem2"].stringValue
                self.scroll.addSubview(templ2)
                
                let templ3 = UILabel(frame: CGRect(x: 580, y: 325, width: 100, height: 80))
                templ3.font = UIFont(name: "Arial", size: 24)
                templ3.textAlignment = .left
                templ3.textColor = .white
                templ3.text = daysJSON["data",2,"tem2"].stringValue
                self.scroll.addSubview(templ3)
                
                let templ4 = UILabel(frame: CGRect(x: 820, y: 325, width: 100, height: 80))
                templ4.font = UIFont(name: "Arial", size: 24)
                templ4.textAlignment = .left
                templ4.textColor = .white
                templ4.text = daysJSON["data",3,"tem2"].stringValue
                self.scroll.addSubview(templ4)
                
                let templ5 = UILabel(frame: CGRect(x: 1060, y: 325, width: 100, height: 80))
                templ5.font = UIFont(name: "Arial", size: 24)
                templ5.textAlignment = .left
                templ5.textColor = .white
                templ5.text = daysJSON["data",4,"tem2"].stringValue
                self.scroll.addSubview(templ5)
                
                let templ6 = UILabel(frame: CGRect(x: 1300, y: 325, width: 100, height: 80))
                templ6.font = UIFont(name: "Arial", size: 24)
                templ6.textAlignment = .left
                templ6.textColor = .white
                templ6.text = daysJSON["data",5,"tem2"].stringValue
                self.scroll.addSubview(templ6)
                
                let templ7 = UILabel(frame: CGRect(x: 1540, y: 325, width: 100, height: 80))
                templ7.font = UIFont(name: "Arial", size: 24)
                templ7.textAlignment = .left
                templ7.textColor = .white
                templ7.text = daysJSON["data",6,"tem2"].stringValue
                self.scroll.addSubview(templ7)
                
                let due = UILabel(frame: CGRect(x: 130, y: 325, width: 30, height: 80))
                due.font = UIFont(name: "Arial", size: 24)
                due.textAlignment = .left
                due.textColor = .white
                due.text = "°C"
                self.scroll.addSubview(due)
                
                let due2 = UILabel(frame: CGRect(x: 370, y: 325, width: 30, height: 80))
                due2.font = UIFont(name: "Arial", size: 24)
                due2.textAlignment = .left
                due2.textColor = .white
                due2.text = "°C"
                self.scroll.addSubview(due2)
                
                let due3 = UILabel(frame: CGRect(x: 610, y: 325, width: 30, height: 80))
                due3.font = UIFont(name: "Arial", size: 24)
                due3.textAlignment = .left
                due3.textColor = .white
                due3.text = "°C"
                self.scroll.addSubview(due3)
                
                let due4 = UILabel(frame: CGRect(x: 850, y: 325, width: 30, height: 80))
                due4.font = UIFont(name: "Arial", size: 24)
                due4.textAlignment = .left
                due4.textColor = .white
                due4.text = "°C"
                self.scroll.addSubview(due4)
                
                let due5 = UILabel(frame: CGRect(x: 1090, y: 325, width: 30, height: 80))
                due5.font = UIFont(name: "Arial", size: 24)
                due5.textAlignment = .left
                due5.textColor = .white
                due5.text = "°C"
                self.scroll.addSubview(due5)
                
                let due6 = UILabel(frame: CGRect(x: 1330, y: 325, width: 30, height: 80))
                due6.font = UIFont(name: "Arial", size: 24)
                due6.textAlignment = .left
                due6.textColor = .white
                due6.text = "°C"
                self.scroll.addSubview(due6)
                
                let due7 = UILabel(frame: CGRect(x: 1570, y: 325, width: 30, height: 80))
                due7.font = UIFont(name: "Arial", size: 24)
                due7.textAlignment = .left
                due7.textColor = .white
                due7.text = "°C"
                self.scroll.addSubview(due7)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
