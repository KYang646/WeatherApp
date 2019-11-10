//
//  ViewController.swift
//  WeatherApp
//
//  Created by David Rifkin on 10/8/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    private var latitude: Double?
    private var longitude: Double?
    private var locationName: String?
    
    private var searchString: String = ""{
        didSet {
        }
        
    }
    
    //MARK: Properties
    lazy var forecastCoView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let coView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 300), collectionViewLayout: layout)
        coView.backgroundColor = .blue
        coView.dataSource = self
        coView.delegate = self
        coView.register(ForecastCoViewCell.self, forCellWithReuseIdentifier: "forecastCell")
        
        return coView
    }()
    
        lazy var titleLabel: UILabel = {
            let title = UILabel()
            title.textAlignment = .center
            title.textColor = .black
            title.font = UIFont.systemFont(ofSize: 20)
            title.text = "Weather forecast for CITY"
            return title
        }()
    
        lazy var zipCodeTextField: UITextField = {
            let textField = UITextField()
            textField.textAlignment = .center
            textField.borderStyle = .line
            textField.backgroundColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
            textField.textColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            textField.delegate = self
            return textField
        }()
    
    
    
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
    }
    
    private func setCons() {
        setTitleCons()
        setCoViewCons()
        setTextFieldCons()
    }
    
    //MARK: Constraints
    private func setCoViewCons() {
        forecastCoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            forecastCoView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            forecastCoView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            forecastCoView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -5),
            forecastCoView.heightAnchor.constraint(equalToConstant: 400)
            
        ])
    }
    
    private func setTitleCons() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -30),
            titleLabel.heightAnchor.constraint(equalToConstant: 40)
        
        ])
    }
    
    private func setTextFieldCons() {
        zipCodeTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            zipCodeTextField.topAnchor.constraint(equalTo: forecastCoView.bottomAnchor, constant: 5),
            zipCodeTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            zipCodeTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -200),
            zipCodeTextField.heightAnchor.constraint(equalToConstant: 45)
        
        
        ])
        
        
    }
    
    
    private func loadData() {
        WeatherAPIHelper.shared.getWeather(latitude: latitude ?? 98765, longitude: longitude ?? 98765, completionHandler: { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let weatherDataFromOnline):
                    self.weatherData = weatherDataFromOnline
                    
                case .failure(_): ()
                }
            }
        })
    }
    
    private func loadLatLongNameFromZip(){
        ZipCodeHelper.getLatLong(fromZipCode: zipCode!, completionHandler: { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let zipData):
                    self.locationName = zipData.name
                    self.longitude = zipData.long
                    self.latitude = zipData.lat
                    self.loadData()
                    
                case .failure(_): ()
                }
            }
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(titleLabel)
        self.view.addSubview(forecastCoView)
        self.view.addSubview(zipCodeTextField)
        self.view.backgroundColor = .lightGray
        
        setCons()
        
        // Do any additional setup after loading the view.
    }
    
    
}






extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherData.count
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150  , height: 150)
    }
}
