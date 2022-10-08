//
//  YagOranıVc.swift
//  WellnessClub
//
//  Created by Hasan Gürbüz on 30.09.2022.
//

import UIKit

class YagOranVc: UIViewController {

    var Yag = YagOranCalculator()
    @IBOutlet weak var BelTf: UITextField!
    @IBOutlet weak var BoyunTf: UITextField!
    @IBOutlet weak var BoyTf: UITextField!
    @IBOutlet weak var KalcaTf: UITextField!
    @IBOutlet weak var CinsiyetTf: UITextField!
    var cinsiyetPw = UIPickerView()
    
    var cinsiyetList = ["Erkek","Kadın"]
    override func viewDidLoad() {
        super.viewDidLoad()

        CinsiyetTf.inputView = cinsiyetPw
        
        cinsiyetPw.delegate = self
        cinsiyetPw.dataSource = self
        self.hideKeyboardWhenTappedAround()
        
        BelTf.attributedPlaceholder = NSAttributedString(
            string: "Ör. 45 yada 45.2",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        BoyunTf.attributedPlaceholder = NSAttributedString(
            string: "Ör. 15 yada 15.4",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        BoyTf.attributedPlaceholder = NSAttributedString(
            string: "Ör. 175",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        KalcaTf.attributedPlaceholder = NSAttributedString(
            string: "Ör. 75 yada 75.8",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        CinsiyetTf.attributedPlaceholder = NSAttributedString(
            string: "Seçiniz",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )

    }

    @IBAction func Hesapla_TUI(_ sender: Any) {
        let bel = Float(BelTf.text!) ?? 0.0
        let boyun = Float(BoyunTf.text!) ?? 0.0
        let boy = Float(BoyTf.text!) ?? 0.0
        let cinsiyet = CinsiyetTf.text
        let kalca = Float(KalcaTf.text!) ?? 0.0
        
        Yag.YagOranHesapla(cinsiyet: cinsiyet!, boy: boy, boyun: boyun, bel: bel, kalca: kalca)
        
        performSegue(withIdentifier: "YagSeg", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "YagSeg" {
            let destinationVc = segue.destination as! YagOranCalculatedVc
            destinationVc.value = Yag.getYagOranValue()
            
        }
    }
    

}

extension YagOranVc: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cinsiyetList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cinsiyetList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        CinsiyetTf.text = cinsiyetList[row]
        CinsiyetTf.resignFirstResponder()
    }
}
