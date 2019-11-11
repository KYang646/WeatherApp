//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by Kimball Yang on 11/10/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    lazy var titleText: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var daImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var conditionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textBlob: UITextView = {
        let blob = UITextView()
        blob.translatesAutoresizingMaskIntoConstraints = false
        return blob
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
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
