//
//  FeedViewController.swift
//  Novigation
//
//  Created by Александр Хмыров on 26.05.2022.
//

import UIKit




class FeedViewController: UIViewController {



    private lazy var buttonPost: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBrown
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.frame = CGRect(x: 20, y: 400, width: 200, height: 50)
        button.layer.cornerRadius = button.frame.height / 2
        button.setTitle("Мой пост", for: .normal)

        return button
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBlue
        self.navigationItem.title = "Лента"

        self.view.addSubview(self.buttonPost)


    }



    @objc private func didTapButton(){
        let postViewController = PostViewController()

        let post = Post(title: "Мой пост")

        postViewController.post = post

        self.navigationController?.pushViewController(postViewController, animated: true)

        

   }


}
