//
//  ProfileViewController.swift
//  Nrtology_IB_Instruments
//
//  Created by Александр Хмыров on 20.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var userView: UIView!


    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadFromNib()
    }


    func loadFromNib() {


        let screenWidth = UIScreen.main.bounds.width
        
        let screenHeight = UIScreen.main.bounds.height

        let nib = UINib(nibName: "ProfileView", bundle: nil)

        let newView = nib.instantiate(withOwner: nil, options: nil).first as! ProfileView


        userView.addSubview(newView)

        newView.frame = CGRect(x: 4, y: 4, width: screenWidth - 30 , height: screenHeight - 20)


    }

}



