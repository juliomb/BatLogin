//
//  ViewController.swift
//  BatLogin
//
//  Created by Timple Soft on 26/11/16.
//  Copyright © 2016 TimpleSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgLogoBatman: UIImageView!
    @IBOutlet weak var lblInstructions: UILabel!
    
    var viewAnimator : UIViewPropertyAnimator!
    private let unlockGesture = UIPanGestureRecognizer()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        unlockGesture.addTarget(self, action: #selector(handle(pan:)))
        self.view.addGestureRecognizer(unlockGesture)
        
        viewAnimator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut, animations: nil) // se podrían añadir aquí tmb
        viewAnimator.addAnimations {
            self.lblInstructions.layer.opacity = 0
            self.imgLogoBatman.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        }
    }

    
    func handle(pan: UIPanGestureRecognizer){
        
        let speed : CGFloat = 2.0
        
        switch pan.state {
        case .began:
            viewAnimator.pauseAnimation()
        case .changed:
            let translation = pan.translation(in: pan.view).y / speed
            viewAnimator.fractionComplete = translation / 100
            if viewAnimator.fractionComplete >= 0.99{
                buildAnimation()
            }
        default:
            break
        }
        
    }
    
    
    func buildAnimation() {
        let logoAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn) {
            self.imgLogoBatman.transform = CGAffineTransform(scaleX: 25, y: 25)
        }
        logoAnimator.startAnimation()
        logoAnimator.addCompletion { (UIViewAnimatingPosition) in
            self.beginApp()
        }
    }
    
    
    func beginApp() {
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
        self.present(loginViewController!, animated: true, completion: nil)
    }


}

