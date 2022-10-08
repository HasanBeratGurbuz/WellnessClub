//
//  YagOranCalculator.swift
//  WellnessClub
//
//  Created by Hasan Gürbüz on 30.09.2022.
//

import Foundation
import UIKit

struct YagOranCalculator {
    var Yag: YagOran?
    
    func getYagOranValue() -> String {
        let YagString = String(format: "%.1f", Yag?.value ?? 0.0)
        return YagString
    }

    mutating func YagOranHesapla(cinsiyet: String, boy: Float, boyun: Float, bel: Float,kalca:Float){
        let Yag_e = 495 / (1.0324 - 0.19077 * log10 (bel - boyun) + 0.15456 * log10 (boy)) - 450
        let Yag_k = 495 / (1.29579 - 0.35004 * log10(bel + kalca - boyun) + 0.22100 * log10(boy)) - 450

        if cinsiyet == "Erkek"{
            Yag = YagOran(value: Yag_e)
        }else{
            Yag = YagOran(value: Yag_k)
        }
        
    }
        
    
    
    
    
}
