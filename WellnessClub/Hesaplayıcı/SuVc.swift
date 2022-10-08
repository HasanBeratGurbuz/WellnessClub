//
//  SuVc.swift
//  WellnessClub
//
//  Created by Hasan Gürbüz on 3.10.2022.
//

import UIKit

class SuVc: UIViewController {

    @IBOutlet weak var AktiviteTf: UITextField!
    @IBOutlet weak var KgTf: UITextField!
    
    var Su = SuCalculator(A: Float())
    var aktiviteList = [
        "30 dakika",
        "1 saat",
        "1.5 saat",
        "2 saat",
        "2.5 saat",
        "3 saat",
        "3.5 saat",
        "+4 saat"
    ]
    
    var aktivitePw = UIPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()

        
        AktiviteTf.inputView = aktivitePw
        
        aktivitePw.delegate = self
        aktivitePw.dataSource = self
        
        KgTf.attributedPlaceholder = NSAttributedString(
            string: "Ör. 72 yada 72.5",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        AktiviteTf.attributedPlaceholder = NSAttributedString(
            string: "Seçiniz",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
    }

    @IBAction func Hesapla_TUI(_ sender: Any) {
        let kilo = Float(KgTf.text!) ?? 0.0
        let aktivite = AktiviteTf.text!
        let index = aktiviteList.firstIndex(of: aktivite)
        
        Su.Calculator(calisma: index!, kg: kilo)
        performSegue(withIdentifier: "SuSeg", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SuSeg" {
            let destinationVc = segue.destination as! SuCalculatedVc
            destinationVc.SuValue = Su.getSuValue()
        }
    }
}

extension SuVc: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return aktiviteList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return aktiviteList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        AktiviteTf.text = aktiviteList[row]
        AktiviteTf.resignFirstResponder()
    }
    
    
    
}
