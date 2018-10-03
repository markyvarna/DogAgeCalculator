//
//  CalculatorView.swift
//  Dog Age Calculator
//
//  Created by Markus Varner on 10/2/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

import UIKit


var result: String = " "
var age: Int = 0
var isSmallDog = false
var isMediumDog = false
var isLargeDog = false

class CalculatorView: UIView {
    
    var results: Calculate? {
        didSet{
            setUpViews()
            
        }
    }
    
    // MARK: - Properties
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pawLogo")!
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let calculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Calculate!", for: .normal)
        button.backgroundColor = MVColors.grootGold()
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        return button
    }()
    
    let tryAnotherButton: UIButton = {
        let button = UIButton()
        button.setTitle("Try Another", for: .normal)
        button.backgroundColor = UIColor.white
        button.layer.borderWidth = 2.0
        button.layer.borderColor = MVColors.grootGold().cgColor
        button.setTitleColor(MVColors.grootGold(), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        return button
    }()
    
    let dogAgeLabel: UILabel = {
        let label = UILabel()
        label.text = "Please enter your dog's age below"
        label.textColor = MVColors.grootGreen()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let dogAgeTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Age (Human Years)"
        tf.backgroundColor = UIColor.white
        tf.textColor = MVColors.grootGold()
        tf.keyboardType = .numberPad
        tf.borderStyle = .roundedRect
        tf.layer.borderWidth = 2.0
        tf.layer.cornerRadius = 5.0
        tf.layer.borderColor = MVColors.grootGold().cgColor
        return tf
    }()
    
    let dogSizeLabel: UILabel = {
        let label = UILabel()
        label.text = "Please select your dogs size"
        label.textColor = MVColors.grootGreen()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let smallDogButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "medium"), for: .normal)
        button.imageView?.clipsToBounds = true
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 2.0
        button.layer.borderColor = MVColors.grootGreen().cgColor
        return button
    }()
    
    let mediumDogButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "small2"), for: .normal)
        button.imageView?.clipsToBounds = true
        button.layer.cornerRadius = 5
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.borderWidth = 2.0
        button.layer.borderColor = MVColors.grootGreen().cgColor
        return button
    }()
    
    let largeDogButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "large"), for: .normal)
        button.imageView?.clipsToBounds = true
        button.layer.cornerRadius = 5
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.borderWidth = 2.0
        button.layer.borderColor = MVColors.grootGreen().cgColor
        return button
    }()
    
    let smallPoundLabel: UILabel = {
        let label = UILabel()
        label.text = "20 lbs or less"
        label.textColor = MVColors.grootGold()
        label.font = UIFont.systemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    
    let mediumPoundLabel: UILabel = {
        let label = UILabel()
        label.text = "21-50 lbs"
        label.textColor = MVColors.grootGold()
        label.font = UIFont.systemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    
    let largePoundLabel: UILabel = {
        let label = UILabel()
        label.text = "50+ lbs"
        label.textColor = MVColors.grootGold()
        label.font = UIFont.systemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    
    let yourDogIsLabel: UILabel = {
        let label = UILabel()
        label.textColor = MVColors.grootGreen()
        label.text = "Your dog is"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    let resultsLabel: UILabel = {
        
            let label = UILabel()
            label.textColor = MVColors.grootGold()
            label.text = result
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 80)
            return label
        
    }()
    
    let yearsOldLabel: UILabel = {
        let label = UILabel()
        label.textColor = MVColors.grootGreen()
        label.text = "Years old in Dog Years"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        smallDogButton.addTarget(self, action: #selector (smallDogBP), for: .touchUpInside)
        mediumDogButton.addTarget(self, action: #selector (mediumDogBP), for: .touchUpInside)
        largeDogButton.addTarget(self, action: #selector (largeDogBP), for: .touchUpInside)
        calculateButton.addTarget(self, action: #selector (calculateBP), for: .touchUpInside)
        tryAnotherButton.addTarget(self, action: #selector(tryAnotherBP), for: .touchUpInside)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Error implimenting view")
    }
    
    func setUpViews() {
        
        //Logo ImageView Constraints
        addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        
        //Calculate Button Constraints
        addSubview(calculateButton)
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        calculateButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -80).isActive = true
        calculateButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        calculateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        calculateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        
        //Calculate Button Constraints
        addSubview(tryAnotherButton)
        tryAnotherButton.translatesAutoresizingMaskIntoConstraints = false
        tryAnotherButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        tryAnotherButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        tryAnotherButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        tryAnotherButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        tryAnotherButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        
        //Dog Age Label Constraints
        addSubview(dogAgeLabel)
        dogAgeLabel.translatesAutoresizingMaskIntoConstraints = false
        dogAgeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        dogAgeLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        dogAgeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        dogAgeLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20).isActive = true
        dogAgeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        
        //Dog Age Textfield Constraints
        addSubview(dogAgeTF)
        dogAgeTF.translatesAutoresizingMaskIntoConstraints = false
        dogAgeTF.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        dogAgeTF.widthAnchor.constraint(equalToConstant: 150).isActive = true
        dogAgeTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        dogAgeTF.topAnchor.constraint(equalTo: dogAgeLabel.bottomAnchor, constant: 8).isActive = true
        dogAgeTF.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        
        //Dog Size Label Constraints
        addSubview(dogSizeLabel)
        dogSizeLabel.translatesAutoresizingMaskIntoConstraints = false
        dogSizeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        dogSizeLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        dogSizeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        dogSizeLabel.topAnchor.constraint(equalTo: dogAgeTF.bottomAnchor, constant: 8).isActive = true
        dogSizeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        
        //Dog Size Stack View buttons
        setupStackOfButtons()
        
        //Your Dog is... Label constraints
        addSubview(yourDogIsLabel)
        yourDogIsLabel.translatesAutoresizingMaskIntoConstraints = false
        yourDogIsLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        yourDogIsLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        yourDogIsLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        yourDogIsLabel.topAnchor.constraint(equalTo: largePoundLabel.bottomAnchor, constant: 60).isActive = true
        yourDogIsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        
        //Results Label Constraints
        addSubview(resultsLabel)
        resultsLabel.translatesAutoresizingMaskIntoConstraints = false
        resultsLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        resultsLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        resultsLabel.heightAnchor.constraint(equalToConstant: 85).isActive = true
        resultsLabel.topAnchor.constraint(equalTo: yourDogIsLabel.bottomAnchor, constant: 20).isActive = true
        resultsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        
        //Years Old Label Constraints
        addSubview(yearsOldLabel)
        yearsOldLabel.translatesAutoresizingMaskIntoConstraints = false
        yearsOldLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        yearsOldLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        yearsOldLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        yearsOldLabel.topAnchor.constraint(equalTo: resultsLabel.bottomAnchor, constant: 20).isActive = true
        yearsOldLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        
    }
    
    // MARK: - Setup Stac View of Buttons
    fileprivate func setupStackOfButtons() {
        
        let stackView = UIStackView(arrangedSubviews: [smallDogButton, mediumDogButton, largeDogButton])
        let labelStackView = UIStackView(arrangedSubviews: [smallPoundLabel, mediumPoundLabel, largePoundLabel])
        addSubview(labelStackView)
        addSubview(stackView)
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        labelStackView.distribution = .fillEqually
        stackView.spacing = 4
        labelStackView.spacing = 0
        NSLayoutConstraint.activate([
            labelStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelStackView.widthAnchor.constraint(equalToConstant: 150),
            labelStackView.heightAnchor.constraint(equalToConstant: 30),
            labelStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            labelStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 4)
            ])
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 150),
            stackView.heightAnchor.constraint(equalToConstant: 60),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.topAnchor.constraint(equalTo: dogSizeLabel.bottomAnchor, constant: 8)
            ])
        
    }

    // MARK : - ACTIONS
    
    @objc func smallDogBP() {
        dogAgeTF.endEditing(true)
        self.smallDogButton.backgroundColor = MVColors.grootGoldLight()
        isSmallDog = true
        isLargeDog = false
        isMediumDog = false
    }
    
    @objc func mediumDogBP() {
        dogAgeTF.endEditing(true)
        self.mediumDogButton.backgroundColor = MVColors.grootGoldLight()
        isMediumDog = true
        isLargeDog = false
        isSmallDog = false
    }
    
    @objc func largeDogBP() {
        dogAgeTF.endEditing(true)
        self.largeDogButton.backgroundColor = MVColors.grootGoldLight()
        isLargeDog = true
        isMediumDog = false
        isSmallDog = false
    }
    
    @objc func calculateBP() {
        dogAgeTF.endEditing(true)
        guard let text = dogAgeTF.text else {return}
        age = Int(text)!
        
        CalculateController.shared.generateResults(age: age, isSmall: isSmallDog, isMedium: isMediumDog, isLarge: isLargeDog)
        result = CalculateController.shared.r
        setUpViews()
        self.resultsLabel.text = result
        print(result)
    }
    
    @objc func tryAnotherBP() {
        
        age = 0
        self.dogAgeTF.text = ""
        self.resultsLabel.text = ""
        self.largeDogButton.backgroundColor = UIColor.white
        self.smallDogButton.backgroundColor = UIColor.white
        self.mediumDogButton.backgroundColor = UIColor.white
        
    }

}

extension UIColor {
    
    public var hexValue: Int {
        
        var rF: CGFloat = 0
        var gF: CGFloat = 0
        var bF: CGFloat = 0
        getRed(&rF, green: &gF, blue: &bF, alpha: nil)
        let r = Int(rF*255)
        let g = Int(gF*255)
        let b = Int(bF*255)
        return r << 16 + g << 8 + b
    }
    
    public convenience init(hex value: Int, alpha: CGFloat = 1) {
        let r = (value & 0xFF0000) >> 16
        let g = (value & 0x00FF00) >> 8
        let b = value & 0x0000FF
        self.init(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: alpha)
    }
}

struct MVColors {
    static func nightOwl() -> UIColor {
        return UIColor(hex: 0x959493)
    }
    
    static func sophBlue() -> UIColor {
        return UIColor(hex: 0x8BBAC6)
    }
    
    static func chambaOrange() -> UIColor {
        return UIColor(hex: 0xFC7335)
    }
    
    static func snowOwl() -> UIColor {
        return UIColor(hex: 0xE1E1E0)
    }
    
    static func grootGold() -> UIColor {
        return UIColor(hex: 0xAF8F47)
    }
    
    static func grootGreen() -> UIColor {
        return UIColor(hex: 0x164E41)
    }
    
    static func grootGoldLight() -> UIColor {
        return UIColor(hex: 0xD4BB9C)
        
    }
    
}
