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
    
    @IBAction func addMovieButton(_ sender: Any) {
        
        guard let newMovie = newMovieTextField.text else {return}
        
        let movie = Movie(movieTitle: newMovie, seenUnseen: true)
        
        delegate?.movieWasAdded(movie: movie)
        navigationController?.popToRootViewController(animated: true)
         
    }
    

}
