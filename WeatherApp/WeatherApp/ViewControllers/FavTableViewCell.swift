//
//  FavTableViewCell.swift
//  WeatherApp
//
//  Created by Kimball Yang on 11/10/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class FavTableViewCell: UITableViewCell {

    lazy var favImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private func setFavCell() {
        NSLayoutConstraint.activate([
            favImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            favImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            favImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            favImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(favImage)
        setFavCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }

}
