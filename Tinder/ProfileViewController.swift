//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Tony Mendoza on 11/15/18.
//  Copyright © 2018 jmaciel. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    var profileImage: UIImage!
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileImageView.image = profileImage
    }

    @IBAction func didTapDone(_ sender: UIButton) {
        self.performSegue(withIdentifier: "returnSegue", sender: nil)
    }
}
