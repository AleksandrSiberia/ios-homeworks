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
       // profileHeaderView.frame = CGRect(x: 10, y: 10, width: 300, height: 500)
        return profileHeaderView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        self.navigationItem.title = "Профиль"
    }

    override func viewWillLayoutSubviews() {
        self.view.addSubview(profileHeaderView)
        profileHeaderView.backgroundColor = .systemGray6

        NSLayoutConstraint.activate([

            self.profileHeaderView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.profileHeaderView.heightAnchor.constraint(equalToConstant: 500)
        ])




    }
    
}
