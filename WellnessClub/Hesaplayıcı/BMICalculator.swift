//
//  BMICalculator.swift
//  WellnessClub
//
//  Created by Hasan Gürbüz on 22.09.2022.
//

import Foundation
import UIKit


struct BMICalculator {
    
    var bmi : BMI?
    
    func getBMIValue() -> String {
        let bmiToDecimal = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiToDecimal
    }
    func getAdvice() -> String {
        return bmi?.advice ?? "No Advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .clear
    }
    
    mutating func calculateBmi(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Yemek Yemelisin!", color: .systemPink)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit Vücuda Sahipsin!", color: .green)
        } else if bmiValue < 29.9 {
            bmi = BMI(value: bmiValue, advice: "Kızartmadan Uzak Dur!", color: .systemCyan)
        } else if bmiValue < 34.9 {
            bmi = BMI(value: bmiValue, advice: "Az Yemelisin!", color: .magenta)
        }else if bmiValue > 34.9{
            bmi = BMI(value: bmiValue, advice: "Diyetisyenle Konuş!", color: .red)
        }else{
            bmi = BMI(value: bmiValue , advice: "Lütfen Tekrar Deneyiniz", color: .red)
        }
    }
    
    
}
