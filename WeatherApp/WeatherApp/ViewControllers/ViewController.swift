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
    
//    lazy var titleLabel: UILabel = {
//        let title = UILabel()
//        title.textAlignment = .center
//        title.text = "Weather forecast for CITY"
//        title.translatesAutoresizingMaskIntoConstraints = false
//        return title
//    }()
//
//    lazy var zipCodeTextField: UITextField = {
//        let textView = UITextField()
//        textView.textAlignment = .center
//        textView.borderStyle = .line
//        textView.backgroundColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
//        textView.textColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
//        //textView.delegate = self
//        return textView
//    }()
    
    
     
     private var weatherData = [WeatherForecast]() {
        didSet {
        forecastCoView.reloadData()
        }
     }
     /*
     private var zipCode: String? {
        didSet {
        loadLatLongNameFromZip()
        forecastCoView.isHidden = false
    }
 */
     
     private func setCons() {
        setCoViewCons()
        view.addSubview(forecastCoView)
        //setTitleCons()
        //setTextFieldCons()
     }
     
    //MARK: Constraints
    private func setCoViewCons() {
        
        forecastCoView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            forecastCoView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 5),
            forecastCoView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            forecastCoView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -5),
            forecastCoView.heightAnchor.constraint(equalToConstant: 400)
            
        ])
    }
    
//    private func constrainImageView(){
//            view.addSubview(cityImage)
//            cityImage.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([
//                cityImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//                cityImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -190),
//                cityImage.heightAnchor.constraint(equalToConstant: 365),
//                cityImage.widthAnchor.constraint(equalTo: self.view.widthAnchor)
//            ])
//        }
//    Collapse
//
//
//

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
        self.view.addSubview(forecastCoView)
        self.view.backgroundColor = .lightGray
        setCons()
        self.delegate = self
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UICollectionViewDataSource {
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return weatherData.count
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150  , height: 150)
    }
}




}
