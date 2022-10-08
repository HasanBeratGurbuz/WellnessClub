//
//  KaloriCalculatedVc.swift
//  WellnessClub
//
//  Created by Hasan Gürbüz on 24.09.2022.
//

import UIKit

class KaloriCalculatedVc: UIViewController {

    @IBOutlet weak var KaloriLbl: UILabel!
    var Value: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        KaloriLbl.text = Value
        view.backgroundColor = .systemGreen
        
    }
    

    @IBAction func TekrarHesapla_TUI(_ sender: Any) {
        dismiss(animated: true,completion: nil)
    }
    
}
