//
//  BMICalculatedVC.swift
//  WellnessClub
//
//  Created by Hasan Gürbüz on 22.09.2022.
//

import UIKit

class BMICalculatedVC: UIViewController {
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?


    @IBOutlet weak var SonucLbl: UILabel!
    @IBOutlet weak var adviceLbl: UILabel!
    @IBOutlet weak var BmiSonuc: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BmiSonuc.text = bmiValue
        adviceLbl.text = advice
        view.backgroundColor = color
    }
    
    @IBAction func tekrarHesapla_TUI(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
