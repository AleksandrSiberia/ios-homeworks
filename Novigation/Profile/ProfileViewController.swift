//
//  ProfileViewController.swift
//  Novigation
//
//  Created by Александр Хмыров on 26.05.2022.
//

import UIKit

final class ProfileViewController: UIViewController {

    private lazy var profileHeaderView: ProfileHeaderView = {
        var profileHeaderView = ProfileHeaderView()
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        profileHeaderView.backgroundColor = .white
        return profileHeaderView
    }()

    private lazy var titleButton: UIButton = {
        var titleButton = UIButton()
        titleButton.backgroundColor = .blue
        titleButton.setTitle("Изменить заголовок", for: .normal)
        titleButton.translatesAutoresizingMaskIntoConstraints = false
        return titleButton
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        self.navigationItem.title = "Профиль"
        self.navigationController?.navigationBar.backgroundColor = .systemBackground
        self.view.addSubview(profileHeaderView)
        self.view.addSubview(titleButton)
        profileHeaderView.backgroundColor = .systemGray6

        NSLayoutConstraint.activate([

            self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 1),
            self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220),

            self.titleButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.titleButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.titleButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.titleButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        profileHeaderView.setFirtResponder()

    }

}
