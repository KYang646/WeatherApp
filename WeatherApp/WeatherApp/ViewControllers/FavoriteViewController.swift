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
        table.backgroundColor = .black
        table.register(FavTableViewCell.self, forCellReuseIdentifier: "favCell")
        
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
    
    private func loadFaves() {
        do { favorites = try ImagePersistenceHelper.manager.getPhotos()
        } catch {
            print(error)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        daTable.delegate = self
        daTable.dataSource = self
        view.addSubview(daTable)
        setDaTable()
        loadFaves()
    }
    
}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(favorites.count)
        return favorites.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = daTable.dequeueReusableCell(withIdentifier: "favCell", for: indexPath) as? FavTableViewCell
        let chosenFav = favorites[indexPath.row]
        let urlString = chosenFav.url
        ImageHelper.shared.getImage(urlStr: urlString) { (Result) in
            DispatchQueue.main.async {
                switch Result {
                case .success(let imageData):
                    cell?.favImage.image = imageData
                case .failure(let error):
                    print(error)
                }
            }
        }
        
        
        return UITableViewCell()
    }
}
