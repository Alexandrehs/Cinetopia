//
//  ViewController.swift
//  Cinetopia
//
//  Created by Alexandre Henrique da Silva on 26/10/24.
//
import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.logo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var coupleImageView: UIImageView = {
        let imageview = UIImageView(image: UIImage.couple)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    
    private lazy var welcomeLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "O lugar ideal para buscar, salvar e organizar seus filmes favoritos!"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private lazy var welcomeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Quero comecar!", for: .normal)
        button.setTitleColor(.background, for: .normal)
        button.backgroundColor = .backgroundColorButton
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 32
        button.addTarget(self, action: #selector(buttonTouch), for: .touchUpInside)
        return button
    } ()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [logoImageView, coupleImageView, welcomeLabel, welcomeButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 32
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .background
        
        addSubViews()
        setContraints()
    }
    
    @objc
    private func buttonTouch() {
        navigationController?.pushViewController(TabBarController(), animated: true)
    }
    
    private func addSubViews() {
        view.addSubview(stackView)
    }

    private func setContraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -64),
            
            welcomeButton.heightAnchor.constraint(equalToConstant: 64),
            welcomeButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 64),
            welcomeButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -64)
        ])
    }
    

}

