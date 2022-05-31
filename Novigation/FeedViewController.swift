//
//  FeedViewController.swift
//  Novigation
//
//  Created by Александр Хмыров on 26.05.2022.
//

import UIKit




class FeedViewController: UIViewController {



    private lazy var buttomPost: UIButton = {
        let buttom = UIButton()
        buttom.backgroundColor = .systemBrown
        buttom.clipsToBounds = true
        buttom.addTarget(self, action: #selector(didTapButtom), for: .touchUpInside)
        buttom.frame = CGRect(x: 20, y: 400, width: 200, height: 50)
        buttom.layer.cornerRadius = buttom.frame.height / 2





 //       self.navigationController?.pushViewController(postViewController, animated: true)

        return buttom
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBlue
        self.navigationItem.title = "Лента"

        self.view.addSubview(self.buttomPost)


    }



    @objc private func didTapButtom(){
       let postViewController = PostViewController()
       self.navigationController?.pushViewController(postViewController, animated: true)


   }


}
