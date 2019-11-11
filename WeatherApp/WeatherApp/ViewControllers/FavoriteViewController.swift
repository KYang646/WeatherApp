//
//  FavoriteViewController.swift
//  WeatherApp
//
//  Created by Kimball Yang on 11/8/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    private var favorites = [Image]() {
        didSet {
            daTable.reloadData()
        }
    }
    
    lazy var daTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .brown
        
        
        return table
    }()
    
    private func setDaTable() {
        NSLayoutConstraint.activate([
            daTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            daTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            daTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            daTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(daTable)
        setDaTable()
       
    }
    
}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        return UITableViewCell()
    }
}
