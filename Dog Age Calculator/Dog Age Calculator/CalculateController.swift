//
//  CalculateController.swift
//  Dog Age Calculator
//
//  Created by Markus Varner on 10/2/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

import Foundation

class CalculateController {
    
    static let shared = CalculateController()
    
    
    var isSmallDog = false
    var isMediumDog = false
    var isLargeDog = false
    var r = " "
    
    func generateResults(age: Int, isSmall: Bool, isMedium: Bool, isLarge: Bool){
        if isSmallDog {
            r = calculateSmallDogAge(age: age)
            Calculate(ageInDogYears: r)
            
        } else if isMediumDog {
            r = calculateMediumDogAge(age: age)
            Calculate(ageInDogYears: r)
        } else {
            r = calculateLargeDogAge(age: age)
            Calculate(ageInDogYears: r)
        }
    }
    
    func calculateSmallDogAge(age: Int) -> String {
        var result = " "
        switch age {
        case 1:
            result = "\(15)"
        case 2:
            result = "\(24)"
        case 3:
            result = "\(28)"
        case 4:
            result = "\(32)"
        case 5:
            result = "\(36)"
        case 6:
            result = "\(40)"
        case 7:
            result = "\(44)"
        case 8:
            result = "\(48)"
        case 9:
            result = "\(52)"
        case 10:
            result = "\(56)"
        case 11:
            result = "\(60)"
        case 12:
            result = "\(64)"
        case 13:
            result = "\(68)"
        case 14:
            result = "\(72)"
        case 15:
            result = "\(76)"
        case 16:
            result = "\(80)"
        default:
            result = "OLD"
        }
         return result
        
    }
    
    func calculateMediumDogAge(age: Int) -> String{
        var result = " "
        switch age {
        case 1:
            result = "\(15)"
        case 2:
            result = "\(24)"
        case 3:
            result = "\(28)"
        case 4:
            result = "\(32)"
        case 5:
            result = "\(36)"
        case 6:
            result = "\(42)"
        case 7:
            result = "\(47)"
        case 8:
            result = "\(51)"
        case 9:
            result = "\(56)"
        case 10:
            result = "\(60)"
        case 11:
            result = "\(65)"
        case 12:
            result = "\(69)"
        case 13:
            result = "\(74)"
        case 14:
            result = "\(78)"
        case 15:
            result = "\(83)"
        case 16:
            result = "\(87)"
        default:
            result = "OLD"
        }
        return result
    }
    
    func calculateLargeDogAge(age: Int) -> String{
        var result = " "
        switch age {
        case 1:
            result = "\(15)"
        case 2:
            result = "\(24)"
        case 3:
            result = "\(28)"
        case 4:
            result = "\(32)"
        case 5:
            result = "\(36)"
        case 6:
            result = "\(45)"
        case 7:
            result = "\(50)"
        case 8:
            result = "\(55)"
        case 9:
            result = "\(61)"
        case 10:
            result = "\(66)"
        case 11:
            result = "\(72)"
        case 12:
            result = "\(77)"
        case 13:
            result = "\(82)"
        case 14:
            result = "\(88)"
        case 15:
            result = "\(93)"
        case 16:
            result = "\(120)"
        default:
            result = "OLD"
        }
        return result
    }
    
}
