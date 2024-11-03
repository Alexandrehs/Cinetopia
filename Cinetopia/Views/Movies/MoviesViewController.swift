//
//  MoviesViewController.swift
//  Cinetopia
//
//  Created by Alexandre Henrique da Silva on 26/10/24.
//

import UIKit

class MoviesViewController: UIViewController, UISearchBarDelegate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Filmes populares"
        view.backgroundColor = .background
        setupNavigationBar()
        addSubViews()
        setupConstraints()
        Task {
           await fetchMovies()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    
    
    private func fetchMovies() async {
        do {
            movies = try await moviesService.fetchMovies()
            tableView.reloadData()
        } catch (let error) {
            print(error)
        }
    }
}
