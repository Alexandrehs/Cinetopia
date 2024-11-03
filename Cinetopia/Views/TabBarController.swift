//
//  TabBarController.swift
//  Cinetopia
//
//  Created by Alexandre Henrique da Silva on 01/11/24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)
        setupTabBar()
    }
    
    private func setupTabBar() {
        let symbolConfiguration = UIImage.SymbolConfiguration(scale: .medium)
        
        let homeBar = UINavigationController(rootViewController: MoviesViewController())
        homeBar.tabBarItem.image = UIImage(systemName: "film", withConfiguration: symbolConfiguration)
        homeBar.tabBarItem.title = "Filmes populares"
        
        let favoritesBar = UINavigationController(rootViewController: FavoriteMoviesViewController())
        favoritesBar.tabBarItem.image = UIImage(systemName: "heart", withConfiguration: symbolConfiguration)
        favoritesBar.tabBarItem.title = "Filmes favoritos"
        
        self.setViewControllers([homeBar, favoritesBar], animated: true)
    }
}
