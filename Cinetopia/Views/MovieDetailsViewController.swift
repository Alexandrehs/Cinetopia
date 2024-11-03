//
//  MovieDetailsViewController.swift
//  Cinetopia
//
//  Created by Alexandre Henrique da Silva on 27/10/24.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    let movie: Movie
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = movie.title
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var moviePosterImageView: UIImageView = {
        let url = URL(string: movie.image)
        let image = UIImageView()
        image.kf.setImage(with: url)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var movieSynopsisLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = movie.synopsis
        label.textColor = .white
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var movieRateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Classificacao dos usuarios: \(movie.rate)"
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
        
        addSubViews()
        setupConstraints()
    }
    
    private func addSubViews() {
        view.addSubview(movieTitleLabel)
        view.addSubview(moviePosterImageView)
        view.addSubview(movieRateLabel)
        view.addSubview(movieSynopsisLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            movieTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            movieTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            moviePosterImageView.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 32),
            moviePosterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            moviePosterImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            moviePosterImageView.heightAnchor.constraint(equalToConstant: 250),
            moviePosterImageView.widthAnchor.constraint(equalToConstant: 200),
            
            movieRateLabel.topAnchor.constraint(equalTo: moviePosterImageView.bottomAnchor, constant: 32),
            movieRateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            movieSynopsisLabel.topAnchor.constraint(equalTo: movieRateLabel.bottomAnchor, constant: 32),
            movieSynopsisLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieSynopsisLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            movieSynopsisLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        // Do any additional setup after loading the view.
    }
}
