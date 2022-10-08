//
//  BmiVc.swift
//  WellnessClub
//
//  Created by Hasan Gürbüz on 21.09.2022.
//

import UIKit

class BmiVc: UIViewController {
    
    var calculator = BMICalculator()
    
    @IBOutlet weak var Kgtf: UITextField!
    @IBOutlet weak var Boytf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        Boytf.attributedPlaceholder = NSAttributedString(
            string: "Ör. 1.80 yada 1.8",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        
        Kgtf.attributedPlaceholder = NSAttributedString(
            string: "Ör. 75 yada 75.2",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        
    }
    
    @IBAction func Hesapla_TUI(_ sender: Any) {
        let boy =  Float(Boytf.text!) ?? 0.0
        let kg = Float(Kgtf.text!) ?? 0.0
        calculator.calculateBmi(height: boy, weight: kg)
        performSegue(withIdentifier: "BmiHesapla", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BmiHesapla" {
            let destinationVc = segue.destination as! BMICalculatedVC
            destinationVc.bmiValue = calculator.getBMIValue()
            destinationVc.advice = calculator.getAdvice()
            destinationVc.color = calculator.getColor()
        }
    }
}
