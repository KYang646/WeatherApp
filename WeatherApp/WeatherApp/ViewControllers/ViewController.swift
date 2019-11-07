//
//  ViewController.swift
//  WeatherApp
//
//  Created by David Rifkin on 10/8/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var latitude: Double?
    private var longitude: Double?

    lazy var forecastCoView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let coView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 0), collectionViewLayout: layout)
        coView.backgroundColor = .clear
        coView.translatesAutoresizingMaskIntoConstraints = false
        //coView.dataSource = self
        //coView.delegate = self
        //coView.register(ForecastCoViewCell.self, forCellWithReuseIdentifier: "forecastCell"
        
        return coView
    }()
    
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.textAlignment = .center
        title.text = "Weather forecast for CITY"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var zipCodeTextField: UITextField = {
        let textView = UITextField()
        textView.textAlignment = .center
        textView.borderStyle = .line
        textView.backgroundColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        textView.textColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        //textView.delegate = self
        return textView
    }()
    
    /*
     
     private var weatherData = [WeatherForecast]() {
        didSet {
        forecastCoView.reloadData()
        }
     }
     
     private var zipCode: String? {
        didSet {
        loadLatLongNameFromZip()
        forecastCoView.isHidden = false
    }
 */
     
     private func setCons() {
        setCoViewCons()
        //setTitleCons()
        //setTextFieldCons()
     }
     
    
    private func setCoViewCons() {
        NSLayoutConstraint.activate([
            forecastCoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            forecastCoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            forecastCoView.widthAnchor.constraint(equalToConstant: forecastCoView.frame.width),
            forecastCoView.heightAnchor.constraint(equalToConstant: 160)
        
        ])
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCons()
        // Do any additional setup after loading the view.
    }


}

