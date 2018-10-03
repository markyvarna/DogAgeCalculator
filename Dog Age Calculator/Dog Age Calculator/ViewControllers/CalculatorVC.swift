//
//  CalculatorVC.swift
//  Dog Age Calculator
//
//  Created by Markus Varner on 10/2/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

import UIKit

class CalculatorVC: UIViewController{
    
    // MARK: - Properties
    var headerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        headerView = CalculatorView()
        headerView.backgroundColor = .white
        self.view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        headerView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        headerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1).isActive = true
        
        
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

