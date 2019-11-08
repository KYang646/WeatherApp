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
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
        addSubViews()
        //        setForecastCons()
        setDateLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private func addSubViews() {
        self.contentView.addSubview(dateLabel)
        self.contentView.addSubview(forecastImage)
        self.contentView.addSubview(tempLabel)
    }
    
    private func setForecastCons() {
        NSLayoutConstraint.activate([
            
            
            
            
        ])
        
    }
    
    private func setDateLabel() {
        NSLayoutConstraint.activate([
//
//            dateLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
//            dateLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
//            dateLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 5),
//            dateLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
}
