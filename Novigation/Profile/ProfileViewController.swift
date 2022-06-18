//
//  ProfileViewController.swift
//  Novigation
//
//  Created by Александр Хмыров on 26.05.2022.
//

import UIKit

final class ProfileViewController: UIViewController {


    private lazy var tableView: UITableView = {
        var tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "ProfileHeaderView")
        tableView.register(PostCell.self, forCellReuseIdentifier: "PostCell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        self.navigationItem.title = "Профиль"
        self.navigationController?.navigationBar.backgroundColor = .systemBackground
        self.view.addSubview(tableView)
        let setupConstraints = setupConstraints()
        NSLayoutConstraint.activate(
            setupConstraints
        )
    }

    private func setupConstraints() -> [NSLayoutConstraint] {
        let topAnchor =  self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let leadingAnchor =   self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let  trailingAnchor =  self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomAnchor =  self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        return [topAnchor, leadingAnchor, trailingAnchor, bottomAnchor]
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayModelPost.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell else { let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }

        let indexPathRow = indexPath.row
        let post = arrayModelPost[indexPathRow]
        cell.setup(this: post)
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            guard let profileHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProfileHeaderView") as? ProfileHeaderView else { return nil }
            return profileHeaderView
        }
        return nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
        return 220
        }
        return 50
    }

}





