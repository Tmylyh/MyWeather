//
//  QueryViewController.swift
//  MyWeather
//
//  Created by mac on 2022/6/27.
//

import UIKit

protocol QueryViewControllerDelegate {
    func didChangeCity(city: String)
}

class QueryViewController: UIViewController {
    var currentCity = ""
    var delegate: QueryViewControllerDelegate?
    
    @IBOutlet weak var searchCityName: UITextField!
    @IBOutlet weak var currentCityLabel: UILabel!
    
    override func viewDidLoad() {
        searchCityName.becomeFirstResponder()
        currentCityLabel.text = currentCity
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func Search(_ sender: Any) {
        dismiss(animated: true)
        if !searchCityName.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            delegate?.didChangeCity(city: searchCityName.text!)
        }
    }
}
