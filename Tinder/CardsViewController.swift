//
//  CardsViewController.swift
//  Tinder
//
//  Created by Tony Mendoza on 11/14/18.
//  Copyright © 2018 jmaciel. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    var cardInitialCenter: CGPoint!
    @IBOutlet weak var cardImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardImageView.layer.cornerRadius = 50
        cardImageView.clipsToBounds = true
        cardImageView.isUserInteractionEnabled = true
    }
    
    @IBAction func onInfoPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "profileViewSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let profileViewController = segue.destination as! ProfileViewController
        profileViewController.profileImage = cardImageView.image
    }
    
    @IBAction func didPanTray(_ sender: UIPanGestureRecognizer) {
            
            let translation = sender.translation(in: view)
            
            if sender.state == .began {
                cardInitialCenter = sender.location(in: cardImageView)
            } else if sender.state == .changed {
                if cardInitialCenter.y >= 199 {
                    if translation.x < 0 {
                        let translationAmount = max(-180, translation.x)
                        let rotationAmount = min(45, -Double(translation.x)/4) * Double.pi / 180
                        cardImageView.transform = CGAffineTransform(translationX: translationAmount, y: 0)
                        cardImageView.transform = cardImageView.transform.rotated(by: CGFloat(rotationAmount))
                    } else {
                        let translationAmount = min(180, translation.x)
                        let rotationAmount = max(-45, -Double(translation.x)/4) * Double.pi / 180
                        cardImageView.transform = CGAffineTransform(translationX: translationAmount, y: 0)
                        cardImageView.transform = cardImageView.transform.rotated(by: CGFloat(rotationAmount))
                    }
                } else {
                    if translation.x < 0 {
                        let translationAmount = max(-180, translation.x)
                        let rotationAmount = max(-45, Double(translation.x)/4) * Double.pi / 180
                        cardImageView.transform = CGAffineTransform(translationX: translationAmount, y: 0)
                        cardImageView.transform = cardImageView.transform.rotated(by: CGFloat(rotationAmount))
                    } else {
                        let translationAmount = min(180, translation.x)
                        let rotationAmount = min(45, Double(translation.x)/4) * Double.pi / 180
                        cardImageView.transform = CGAffineTransform(translationX: translationAmount, y: 0)
                        cardImageView.transform = cardImageView.transform.rotated(by: CGFloat(rotationAmount))
                    }
                }
            } else if sender.state == .ended {
                if translation.x > 50 {
                    UIView.animate(withDuration: 0.1, animations: {
                        self.cardImageView.center.x += 100
                    }) { (success) in
                        if success {
                            self.cardImageView.isHidden = true
                        }
                    }
                }
                else if translation.x < -50 {
                    UIView.animate(withDuration: 0.1, animations: {
                        self.cardImageView.center.x -= 100
                    }) { (success) in
                        if success {
                            self.cardImageView.isHidden = true
                        }
                    }
                    
                }
                else {
                    UIView.animate(withDuration: 0.1, animations: {
                        self.cardImageView.transform = CGAffineTransform.identity
                    }) { (success) in
                        if success {
                            self.cardImageView.isHidden = false
                        }
                    }
                }
            }
        }
}
