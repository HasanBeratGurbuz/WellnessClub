//
//  YagOranCalculatedVc.swift
//  WellnessClub
//
//  Created by Hasan Gürbüz on 3.10.2022.
//

import UIKit

class YagOranCalculatedVc: UIViewController {

    @IBOutlet weak var sonucLbl: UILabel!
    
    var value: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sonucLbl.text = "% \(value ?? "%.1f")"
    }

    @IBAction func TekrarHesap_TUI(_ sender: Any) {
        dismiss(animated: true,completion: nil)
        
    }
    
}
