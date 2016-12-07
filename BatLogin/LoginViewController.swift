//
//  LoginViewController.swift
//  BatLogin
//
//  Created by Timple Soft on 27/11/16.
//  Copyright © 2016 TimpleSoft. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var imgLogoBatman: UIImageView!
    @IBOutlet weak var imgBatLogin: UIImageView!
    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var lblPass: UILabel!
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var btnEnter: UIButton!
    
    var headerAnimator : UIViewPropertyAnimator!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // desplazamos todas las vistas a fuera de la pantalla
        imgLogoBatman.transform = CGAffineTransform(translationX: 0, y: -120)
        imgBatLogin.transform = CGAffineTransform(translationX: 0, y: -170)
        lblUser.transform = CGAffineTransform(translationX: -200, y: 0)
        lblPass.transform = CGAffineTransform(translationX: -200, y: 0)
        txtUser.transform = CGAffineTransform(translationX: 350, y: 0)
        txtPass.transform = CGAffineTransform(translationX: 350, y: 0)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureView()
        buildAnimations()
    }
    
    
    func configureView(){
        
        txtUser.layer.cornerRadius = 3
        txtPass.layer.cornerRadius = 3
        btnEnter.layer.cornerRadius = 3
    
    }
    
    
    func buildAnimations(){
        
        headerAnimator = UIViewPropertyAnimator(duration: 0.6, curve: .easeInOut, animations: nil)
        headerAnimator.addAnimations {
            self.imgLogoBatman.transform = CGAffineTransform.identity
            self.imgBatLogin.transform = CGAffineTransform.identity
            self.lblUser.transform = CGAffineTransform.identity
            self.lblPass.transform = CGAffineTransform.identity
            self.txtUser.transform = CGAffineTransform.identity
            self.txtPass.transform = CGAffineTransform.identity
        }
        headerAnimator.startAnimation()
        
    }

}
