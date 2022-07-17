//
//  CellTableViewCell.swift
//  MyWeather
//
//  Created by mac on 2022/6/28.
//

import UIKit

class Cell: UITableViewCell {
    let date = UILabel()
    let time = UILabel()
    let temp = UILabel()
    let temp1 = UILabel()
    let p1 = UILabel()
    let p = UILabel()
    let wth = UILabel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        timez.frame = CGRect(x: 10, y: 10, width: 10, height: 10)
//        timez.backgroundColor = .blue
//        timez.text = "abcd"
//        self.contentView.addSubview(timez)
    }
    
    func setup() {
        time.frame = CGRect(x: 10, y: 5, width: 100, height: 50)
        time.font = UIFont(name: "Arial", size: 24)
        time.textAlignment = .left
        time.textColor = .white
        self.contentView.addSubview(time)
        
        date.frame = CGRect(x: 10, y: 30, width: 150, height: 50)
        date.font = UIFont(name: "Arial", size: 20)
        date.textAlignment = .left
        date.textColor = .white
        self.contentView.addSubview(date)
        
        temp.frame = CGRect(x: 140, y: 13, width: 100, height: 50)
        temp.font = UIFont(name: "Arial", size: 24)
        temp.textAlignment = .left
        temp.textColor = .white
        self.contentView.addSubview(temp)
        
        temp1.frame = CGRect(x: 210, y: 13, width: 100, height: 50)
        temp1.font = UIFont(name: "Arial", size: 24)
        temp1.textAlignment = .left
        temp1.textColor = .white
        self.contentView.addSubview(temp1)
        
        p1.frame = CGRect(x: 240, y: 13, width: 90, height: 50)
        p1.font = UIFont(name: "Arial", size: 24)
        p1.textAlignment = .left
        p1.textColor = .white
        p1.text = "°C"
        self.contentView.addSubview(p1)
        
        p.frame = CGRect(x: 170, y: 13, width: 90, height: 50)
        p.font = UIFont(name: "Arial", size: 24)
        p.textAlignment = .left
        p.textColor = .white
        p.text = "°C/"
        self.contentView.addSubview(p)
        
        wth.frame = CGRect(x: 270, y: 13, width: 100, height: 50)
        wth.font = UIFont(name: "Arial", size: 24)
        wth.textAlignment = .center
        wth.textColor = .white
        self.contentView.addSubview(wth)
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        setup()
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
