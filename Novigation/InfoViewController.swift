//
//  InfoViewController.swift
//  Novigation
//
//  Created by Александр Хмыров on 27.05.2022.
//

import UIKit

class InfoViewController: UIViewController {


    var post: Post?


    private lazy var alertButtom: UIButton = {
        let buttom = UIButton()

        buttom.frame = CGRect(x: 20, y: 150, width: 150, height: 30)

        return buttom
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(alertButtom)
        self.view.backgroundColor = .systemBackground

        if let post1: String = self.post?.title {

            print(post1)
            self.navigationItem.title = post1
        }

        else {
        }



        



        






    }





//    private lazy var button: UIButton = {
//        let button = UIButton(frame: CGRect(x: 20, y: 220, width: 300, height: 50))
//        button.backgroundColor = .systemBlue
//        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
//        return button
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.backgroundColor = .white
//        self.navigationItem.title = "Первый экран"
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//
//        self.view.addSubview(self.button)
//
//        self.button.layer.cornerRadius = self.button.frame.height / 2
//        self.button.clipsToBounds = true
//    }
//
//    @objc private func didTapButton() {
//        let ac = UIAlertController(title: "123", message: "4567", preferredStyle: .actionSheet)
//
//        let okAction = UIAlertAction(title: "ОК", style: .default) { _ in
//            // do smth
//        }
//        let firstAction = UIAlertAction(title: "Удалить", style: .destructive) { _ in
//            // do smth
//        }
//        let secondAction = UIAlertAction(title: "Отменить", style: .cancel, handler: nil)
//
//        ac.addAction(okAction)
//        ac.addAction(firstAction)
//        ac.addAction(secondAction)
//
//        self.present(ac, animated: true, completion: nil)



}




