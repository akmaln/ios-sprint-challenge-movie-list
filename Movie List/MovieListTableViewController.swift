//
//  MovieListTableViewController.swift
//  Movie List
//
//  Created by Akmal Nurmatov on 3/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class MovieListTableViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var movieTableView: UITableView!
    
    var movies: [Movie] = [Movie(movieTitle: "The Dark Night Rises", seenUnseen: true)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "ShowNewMovie" {
    
    guard let newMovieVC = segue.destination as? AddMovieViewController else { return }
        newMovieVC.delegate = self
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MoviesTableViewCell else { fatalError("cell is not a MoviesATableViewCell")}

        let movie = movies[indexPath.row]
        cell.movie = movie

        return cell
    }
}

extension MovieListTableViewController: NewMovieDelegate {
    func movieWasAdded(movie: Movie) {
        movies.append(movie)
        movieTableView.reloadData()
    }
}


