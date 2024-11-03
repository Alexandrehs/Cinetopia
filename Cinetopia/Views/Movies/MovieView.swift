//
//  MovieView.swift
//  Cinetopia
//
//  Created by Alexandre Henrique da Silva on 02/11/24.
//

import UIKit

class MovieView: UIView {
    private var isFiltered: Bool = false
    private var moviesFilted: [Movie] = []
    private let moviesService = MoviesService()
    private var movies: [Movie] = []
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .clear
        table.dataSource = self
        table.delegate = self
        table.register(MovieTableViewCell.self, forCellReuseIdentifier: "movieCell")
        return table
    }()
    
    private lazy var seachBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.placeholder = "Pesquisar"
        search.searchTextField.backgroundColor = .white
        search.delegate = self
        return search
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setupConstraints()
    }
    
    private func addSubViews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupNavigationBar() {
        title = "Filmes populares"
        navigationController?.navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.titleView = seachBar
    }
}

extension MovieView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isFiltered ? moviesFilted.count : movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell {
            let movie = isFiltered ? moviesFilted[indexPath.row] : movies[indexPath.row]
            cell.cellConfigure(movie: movie)
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let movie = isFiltered ? moviesFilted[indexPath.row] : movies[indexPath.row]
        let movieDetails = MovieDetailsViewController(movie: movie)
        
        navigationController?.pushViewController(movieDetails, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isFiltered = false
        } else {
            isFiltered = true
            moviesFilted = movies.filter({ movie in
                movie.title.lowercased().contains(searchText.lowercased())
            })
        }
        
        tableView.reloadData()
    }
}

extension MovieView: MovieTableViewCellDelegate {
    func didSelectFavoriteButton(sender: UIButton) {
        guard let cell = sender.superview?.superview as? MovieTableViewCell else {
            return
        }
        
        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        
        let favoriteMovie = movies[indexPath.row]
        favoriteMovie.changeFavoriteMovie()
        MovieManager.shared.add(favoriteMovie)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
