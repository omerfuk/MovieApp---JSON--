//
//  FavoritesViewController.swift
//  MovieApp - JSON -
//
//  Created by Ömer Faruk Kılıçaslan on 13.06.2022.
//

import UIKit

class FavoritesViewController: UIViewController {

    var favorites = [Movie]()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        title = "Favorites"
        
    }

}


extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        cell.textLabel?.text = favorites[indexPath.row].title
        return cell
    }
    
    
    
}
