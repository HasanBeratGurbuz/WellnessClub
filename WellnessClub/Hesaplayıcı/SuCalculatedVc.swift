//
//  SuCalculatedVc.swift
//  WellnessClub
//
//  Created by Hasan Gürbüz on 3.10.2022.
//

import UIKit

class SuCalculatedVc: UIViewController {

    @IBOutlet weak var SuSonuvLbl: UILabel!
    var SuValue : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        SuSonuvLbl.text = "\(SuValue ?? "%.1f") Litre"
    }
    
    @IBAction func TekrarHesap_TUI(_ sender: Any) {
        dismiss(animated: true,completion: nil)
    }
}
