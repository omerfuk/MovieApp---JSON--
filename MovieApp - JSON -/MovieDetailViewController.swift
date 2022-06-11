//
//  MovieDetailViewController.swift
//  MovieApp - JSON -
//
//  Created by Ömer Faruk Kılıçaslan on 3.06.2022.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var lblCategories: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSummary: UITextView!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        image.image = UIImage(named: movie.imageWide)
        lblTitle.text = movie.title
        lblDuration.text = movie.duration
        lblRating.text = "⭐️\(movie.rating)/10"
        lblSummary.text = movie.summary
        lblCategories.text = movie.categoriesDescription
        
    }
    

 

}
