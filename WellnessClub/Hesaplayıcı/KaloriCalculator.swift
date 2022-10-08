//
//  KaloriCalculator.swift
//  WellnessClub
//
//  Created by Hasan Gürbüz on 23.09.2022.
//

import Foundation
import UIKit

struct KaloriCalculator {
    
    var hesap: KaloriVc?
    var Kalori: KaloriIhtiyac?
    var A: Float
    
    func getKaloriValue() -> String {
        let kaloriString = String(format: "%.1f", Kalori?.Value ?? 0.0)
        return kaloriString
    }
    
    mutating func KaloriniHesapla(cinsiyet:String,calismaBicimi:Int,yas:Float,boy:Float,kg:Float){
        
        let part1E = 66 + (13.7 * kg)
        let part2E = (5 * boy) - (6.8 * yas)
        let part1K = 665 + (9.6 * kg)
        let part2K = (1.8 * boy) - (4.7 * yas)
        
        if calismaBicimi == 0{
                 A = 1.1
            }else if calismaBicimi == 1 {
                 A = 1.4
            }else if calismaBicimi == 2 {
                 A = 1.6
            }else if calismaBicimi == 3 {
                 A = 1.8
            }else if calismaBicimi == 4 {
                 A = 1.9
            }
            
        let BMR_E = part1E + part2E
        let BMR_K = part1K + part2K
        
        let W_AB_E = BMR_E * A
        let W_AB_K = BMR_K * A
       
        let KaloriHesapE = W_AB_E
        let KaloriHesapK = W_AB_K
        
        if cinsiyet == "Erkek" {
            Kalori = KaloriIhtiyac(Value: KaloriHesapE)
        }else {
            Kalori = KaloriIhtiyac(Value: KaloriHesapK)
        }
        
    }
}
