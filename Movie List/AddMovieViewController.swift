//
//  AddMovieViewController.swift
//  Movie List
//
//  Created by Akmal Nurmatov on 3/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

protocol  NewMovieDelegate {
    func movieWasAdded(movie: Movie)
}
class AddMovieViewController: UIViewController {

    @IBOutlet weak var newMovieTextField: UITextField!
    
    
    var delegate: NewMovieDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
 
    @IBAction func addMovieButton(_ sender: Any) {
        
        guard let newMovie = newMovieTextField.text else {return}
        
        let movie = Movie(movieTitle: newMovie, seenUnseen: true)
        
        delegate?.movieWasAdded(movie: movie)
         
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
