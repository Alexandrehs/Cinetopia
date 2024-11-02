//
//  FavoriteMoviesViewController.swift
//  Cinetopia
//
//  Created by Alexandre Henrique da Silva on 30/10/24.
//

import UIKit

class FavoriteMoviesCollectionViewCell: UICollectionViewCell {
    
    private lazy var moviePosterImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 12
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var buttonFavorite: UIButton = {
        let buttonFavorite = UIButton()
        buttonFavorite.translatesAutoresizingMaskIntoConstraints = false
        let iconImage = UIImage(systemName: "heart.fill")?.withTintColor(.backgroundColorButton, renderingMode: .alwaysOriginal)
        buttonFavorite.setImage(iconImage, for: .normal)
        buttonFavorite.addTarget(self, action: #selector(didTapFavoriteButton), for: .touchUpInside)
        return buttonFavorite
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .background
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        addSubview(moviePosterImageView)
        addSubview(titleLabel)
        addSubview(buttonFavorite)
        
        NSLayoutConstraint.activate([
            moviePosterImageView.topAnchor.constraint(equalTo: topAnchor),
            moviePosterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            moviePosterImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            moviePosterImageView.heightAnchor.constraint(equalToConstant: 130),
            
            titleLabel.topAnchor.constraint(equalTo: moviePosterImageView.bottomAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            buttonFavorite.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 7),
            buttonFavorite.heightAnchor.constraint(equalToConstant: 25),
            buttonFavorite.widthAnchor.constraint(equalToConstant: 25),
            buttonFavorite.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func setupView(movie: Movie) {
        let url = URL(string: movie.image)
        moviePosterImageView.kf.setImage(with: url)
        titleLabel.text = movie.title
    }
    
    @objc
    private func didTapFavoriteButton(_ sender: UIButton) {
        print("didFavoriteButton")
    }
}
