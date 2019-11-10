//
//  ForecastCoViewCell.swift
//  WeatherApp
//
//  Created by Kimball Yang on 11/7/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class ForecastCoViewCell: UICollectionViewCell {
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var forecastImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
        addSubViews()
        setTheCons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private func addSubViews() {
        self.contentView.addSubview(dateLabel)
        self.contentView.addSubview(forecastImage)
        self.contentView.addSubview(tempLabel)
    }
    
    private func setDateCons() {
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            dateLabel.widthAnchor.constraint(equalToConstant: 100),
            dateLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            dateLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setIconCons() {
        NSLayoutConstraint.activate([
            forecastImage.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            forecastImage.widthAnchor.constraint(equalToConstant: 100),
            forecastImage.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            forecastImage.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    private func setTempCons() {
        NSLayoutConstraint.activate([
            tempLabel.topAnchor.constraint(equalTo: forecastImage.bottomAnchor, constant: 5),
            tempLabel.widthAnchor.constraint(equalToConstant: 100),
            tempLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            tempLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setTheCons() {
        setDateCons()
        setIconCons()
        setTempCons()
    }
}
