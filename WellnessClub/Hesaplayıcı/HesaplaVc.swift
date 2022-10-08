//
//  BmiCalculatorMainVC.swift
//  WellnessClub
//
//  Created by Hasan Gürbüz on 16.09.2022.
//

import UIKit

class HesaplaVc: UIViewController {

    @IBOutlet weak var SuMiktariBtn: UIButton!
    @IBOutlet weak var YagOraniBtn: UIButton!
    @IBOutlet weak var KaloriBtn: UIButton!
    @IBOutlet weak var BoykiloBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Hesaplayıcı"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }
    @IBAction func BoyKilo_TUI(_ sender: Any) {
        performSegue(withIdentifier: "BmiVC", sender: self)
    }
    
    
    @IBAction func Kalori_TUI(_ sender: Any) {
        performSegue(withIdentifier: "KaloriVC", sender: self)
    }
    
    
    @IBAction func YagOrani_TUI(_ sender: Any) {
        performSegue(withIdentifier: "YagOranVc", sender: self)

    }
    
    
    @IBAction func SuMiktari_TUI(_ sender: Any) {
        performSegue(withIdentifier: "SuVc", sender: self)
    }
}
