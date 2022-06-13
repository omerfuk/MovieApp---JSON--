//
//  ViewController.swift
//  MovieApp - JSON -
//
//  Created by Ömer Faruk Kılıçaslan on 3.06.2022.
//

//Version 1.0, Just before the Swipe Actions Added.
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var movies = [Movie]()
    var isFavorite: Bool = false
    
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadData()
        
        

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MovieDetailViewController
        guard let row = tableView.indexPathForSelectedRow?.row else {return}
        
        let movie = movies[row]
        vc.movie = movie
    }
    
    func loadData() {
        
        guard let jsonUrl = Bundle.main.url(forResource: "movies", withExtension: "json"), let data = try? Data(contentsOf: jsonUrl) else {
            return
        }
        
        do {
            movies = try JSONDecoder().decode([Movie].self, from: data)
        } catch  {
            print(error)
        }
        tableView.reloadData()
    }

    
    //Table
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        
        let row = movies[indexPath.row]
        
        cell.prepare(movie: row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let favAction = UIContextualAction(style: .normal, title: "🌟") { contextualAction, view, boolValue in
            
            
            if self.isFavorite == true {
               //send cell data to favoritesViewController
                
            }
            else {
                //remove cell data from favoritesViewController
                
            }
            


        }
        
        if self.isFavorite == true {
            favAction.backgroundColor = .red
            
            print("Removed from Favorite : \(self.movies[indexPath.row].title)")
            self.isFavorite = false
            
        }
        
        else {
            favAction.backgroundColor = .green
            print("Added to Favorite : \(self.movies[indexPath.row].title)")
            self.isFavorite = true
        }
        
       
        
        return UISwipeActionsConfiguration(actions: [favAction])
    }
    

}

