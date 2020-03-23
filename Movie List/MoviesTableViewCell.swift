//
//  MoviesTableViewCell.swift
//  Movie List
//
//  Created by Akmal Nurmatov on 3/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

protocol MovieCellDelegate {
    func cellWasTapped()
}

class MoviesTableViewCell: UITableViewCell {
    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var seenButton: UIButton!
    
    var delegate: MovieCellDelegate?
    var movie: Movie? {
        didSet {
            updateViews()
        }
    }
    @IBAction func seenUnseenButton(_ sender: Any) {
        movie!.seenUnseen = !movie!.seenUnseen
        
        delegate?.cellWasTapped() 
    }
    func updateViews() {
        guard let movie = movie else { return }
        
        movieLabel.text = movie.movieTitle
        
        if movie.seenUnseen == true {
            seenButton.setTitle("Seen", for: .normal)
        } else {
            seenButton.setTitle("Unseen", for: .normal)
        }
    }
}
