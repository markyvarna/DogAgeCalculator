//
//  LaunchVC.swift
//  Dog Age Calculator
//
//  Created by Markus Varner on 10/3/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

import UIKit
import RevealingSplashView

class LaunchVC: UIViewController {

    var firstView: UIView!
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pawLogo")!
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //Launch Screen Animation Property
    let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "pawLogo")!, iconInitialSize: CGSize(width: 80, height: 80), backgroundColor: UIColor.white)
    
    override func viewDidLoad() {
        super.viewDidLoad()

       firstView = UIView()
        self.view.addSubview(firstView)
        self.firstView.backgroundColor = UIColor.white
        firstView.translatesAutoresizingMaskIntoConstraints = false
        firstView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        firstView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        firstView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        firstView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1).isActive = true
        
//        firstView.addSubview(logoImageView)
//        logoImageView.translatesAutoresizingMaskIntoConstraints = false
//        logoImageView.centerXAnchor.constraint(equalTo: firstView.centerXAnchor).isActive = true
//        logoImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
//        logoImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        logoImageView.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 100).isActive = true
        
        self.firstView.addSubview(revealingSplashView)
        revealingSplashView.animationType = .popAndZoomOut
        revealingSplashView.startAnimation {
            self.revealingSplashView.heartAttack = true
            self.present(CalculatorVC(), animated: false, completion: nil)
        }
        //this stops the launch screen animation
        
        
//        self.dismiss(animated: true, completion: nil)
    }
    
    func setUpView() {
        
        //Logo ImageView Constraints
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
