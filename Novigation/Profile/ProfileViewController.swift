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


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        self.navigationItem.title = "Профиль"
        self.navigationController?.navigationBar.backgroundColor = .systemBackground

//        let gesture = UIGestureRecognizer()
//        gesture.addTarget(self, action: #selector(gestureAction))
//        self.view.addGestureRecognizer(gesture)


    }

    override func viewWillLayoutSubviews() {
        self.view.addSubview(profileHeaderView)
        profileHeaderView.backgroundColor = .systemGray6

        NSLayoutConstraint.activate([

            self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 1),
            self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.profileHeaderView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -1)
        ])
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        profileHeaderView.setFirtResponder()

    }

//    @objc private func gestureAction() {
//        self.view.endEditing(true)
//
//    }
    
}
