//
//  PostViewController.swift
//  Novigation
//
//  Created by Александр Хмыров on 26.05.2022.
//

import UIKit

class PostViewController: UIViewController {



    override func viewDidLoad() {


        super.viewDidLoad()
        
        self.view.backgroundColor = .systemOrange
        self.navigationItem.title = "Пост"


        let rightBottom = UIBarButtonItem(title: "Настройки", style: .plain, target: self, action: #selector(didTapButtom))

        self.navigationItem.rightBarButtonItem = rightBottom

    }


    
    @objc private func didTapButtom(){

        let infoViewController = InfoViewController()

        let post: Post = Post(title: "Мой пост")
        
        infoViewController.post = post

        let infoUINavigationController = UINavigationController(rootViewController: infoViewController)




        present(infoUINavigationController, animated: true)

    }





}
