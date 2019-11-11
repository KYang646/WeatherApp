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
    
    lazy var titleText: UILabel = {
        let title = UILabel()
        title.backgroundColor = .yellow
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var daImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .magenta
        return image
    }()
    
    lazy var conditionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .cyan
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textBlob: UILabel = {
        let blob = UILabel()
        blob.backgroundColor = .green
        blob.translatesAutoresizingMaskIntoConstraints = false
        blob.numberOfLines = 0
        return blob
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setDaView()
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
            daImage.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 25),
            daImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            daImage.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            daImage.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
    private func setCondCon() {
        NSLayoutConstraint.activate([
            conditionLabel.topAnchor.constraint(equalTo: daImage.bottomAnchor, constant: 5),
            conditionLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            conditionLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: 200),
            conditionLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setDaBlob() {
        NSLayoutConstraint.activate([
            textBlob.topAnchor.constraint(equalTo: conditionLabel.bottomAnchor, constant: 5),
            textBlob.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            textBlob.widthAnchor.constraint(equalToConstant: 350),
            textBlob.heightAnchor.constraint(equalToConstant: 400)
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
