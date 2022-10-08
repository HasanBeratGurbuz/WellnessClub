//
//  SuCalculator.swift
//  WellnessClub
//
//  Created by Hasan Gürbüz on 3.10.2022.
//

import Foundation
import UIKit

struct SuCalculator {
    var Su: SuValue?
    var A: Float
    
    func getSuValue() -> String {
        let SuString = String(format: "%.1f", Su?.SuValue ?? 0.0)
        return SuString
    }
    mutating func Calculator(calisma: Int, kg: Float) {
        
        if calisma == 0 {
            A = 0.35
        }else if calisma == 1{
            A = 0.55
        }else if calisma == 2{
            A = 0.70
        }else if calisma == 3{
            A = 1
        }else if calisma == 4{
            A = 1.10
        }else if calisma == 5{
            A = 1.25
        }else if calisma == 6{ //4
            A = 1.45
        }else {
            A = 2
        }
        
        
        let SuHesap = (kg * 0.03) + A
        Su = SuValue(SuValue: SuHesap)
    }
}
