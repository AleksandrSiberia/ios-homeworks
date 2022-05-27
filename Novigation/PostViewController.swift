//
//  PostViewController.swift
//  Novigation
//
//  Created by Александр Хмыров on 26.05.2022.
//

import UIKit

class PostViewController: UIViewController {
//
//    let rightButton: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: nil, action: nil)
//    self.navigationItem.rightBarButtonItem = rightButton

    private lazy var rightBottom: UIBarButtonItem = {
        let buttom = UIBarButtonItem()

        buttom.title = "11111"

        return buttom
        
    }()





    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemOrange
        self.navigationItem.title = "Пост"

        present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
        
//        self.navigationItem.hidesBackButton = true

        

    }
    


}
