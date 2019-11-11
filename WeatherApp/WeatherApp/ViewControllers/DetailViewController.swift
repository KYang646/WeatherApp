//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by Kimball Yang on 11/10/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var selectedWeather: WeatherForecast!
    var selectedLoc: String! = nil
    
    lazy var titleText: UILabel = {
        let title = UILabel()
        title.textAlignment = .center
        title.text = "Weather forecast for \(selectedLoc!) on \(selectedWeather.date)"
        title.backgroundColor = .yellow
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var daImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .magenta
        
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var conditionLabel: UILabel = {
        let label = UILabel()
        label.text = selectedWeather.summary
        label.textAlignment = .center
        label.backgroundColor = .cyan
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textBlob: UILabel = {
        let blob = UILabel()
        blob.text = "High Temp: \(selectedWeather.temperatureHigh)\nLow Temp: \(selectedWeather.temperatureLow)\nSunrise: \(selectedWeather.sunriseTime)\nSunset: \(selectedWeather.sunsetTime)\nWindspeed: \(selectedWeather.windSpeed)\n Precipitation: \(selectedWeather.precipProbability) "
        blob.backgroundColor = .green
        blob.translatesAutoresizingMaskIntoConstraints = false
        blob.numberOfLines = 0
        return blob
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setDaView()
        let daLink = PixabayAPIClient.getSearchResultsURLStr(from: selectedLoc)
        PixabayAPIClient.manager.getImage(urlStr: daLink) { (Result) in
            DispatchQueue.main.async {
                switch Result {
                case .success(let imageData):
                    if let randomImage = Image.getRandomImage(images: imageData) {
                        self.dataToImage(someImage: randomImage)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
        
    }
    
    private func dataToImage(someImage: Image) {
        let urlStr = someImage.url
        ImageHelper.shared.getImage(urlStr: urlStr) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                    self.daImage.image = UIImage(named: "na")
                case .success(let imageFromURL):
                    self.daImage.image = imageFromURL
                }
            }
        }
    }
    
    private func setTitleCon() {
        NSLayoutConstraint.activate([
            titleText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            titleText.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            titleText.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            titleText.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setImageCon() {
        NSLayoutConstraint.activate([
            daImage.topAnchor.constraint(equalTo: titleText.bottomAnchor),
            daImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            daImage.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            daImage.heightAnchor.constraint(equalToConstant: 350)
        ])
    }
    
    private func setCondCon() {
        NSLayoutConstraint.activate([
            conditionLabel.topAnchor.constraint(equalTo: daImage.bottomAnchor),
            conditionLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            conditionLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: 200),
            conditionLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setDaBlob() {
        NSLayoutConstraint.activate([
            textBlob.topAnchor.constraint(equalTo: conditionLabel.bottomAnchor, constant: 5),
            textBlob.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            textBlob.widthAnchor.constraint(equalToConstant: 200),
            textBlob.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setDaView() {
        view.addSubview(titleText)
        view.addSubview(daImage)
        view.addSubview(conditionLabel)
        view.addSubview(textBlob)
        setTitleCon()
        setImageCon()
        setCondCon()
        setDaBlob()
    }
    
//    private func setDaCons() {
//
//    }()
    
/*
     titleText
     daImage
     conditionLabel
     High
     Low
     Sunrise
     Sunset
     Windspeed
     Inches of Precip
     
     
     */
  

}
