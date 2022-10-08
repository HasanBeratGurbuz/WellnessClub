//
//  KaloriVc.swift
//  WellnessClub
//
//  Created by Hasan Gürbüz on 22.09.2022.
//

import UIKit

class KaloriVc: UIViewController {
    
    var Kalori = KaloriCalculator(A: Float())
    
    @IBOutlet weak var KiloTf: UITextField!
    @IBOutlet weak var BoyTf: UITextField!
    @IBOutlet weak var YasTF: UITextField!
    @IBOutlet weak var CalismaBicimiTf: UITextField!
    @IBOutlet weak var CinsiyetTf: UITextField!
    
    var CinsiyetList = ["Erkek", "Kadın"]
    var CalismaBicimiListe = [
        "Masa başı bir işte çalışıyorum, fazla hareket etmiyorum.",
        "Az hareket ettiğim bir iş yapıyorum, hafif egzersizler yapıyorum",
        "Orta derecede hareket gerektiren bir iş yapıyorum, haftada 3-4 gün spor yapıyorum",
        "Çok aktif olduğum bir iş yapıyorum, haftada 5 gün spor yapıyorum",
        "Yoğun iş, profesyonel seviyede antreman"
    ]
    
    var CinsiyetPw = UIPickerView()
    var CalismaBicimiPw = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CinsiyetTf.inputView = CinsiyetPw
        CalismaBicimiTf.inputView = CalismaBicimiPw
        
        
        CinsiyetPw.delegate = self
        CinsiyetPw.dataSource = self
        
        CalismaBicimiPw.delegate = self
        CalismaBicimiPw.dataSource = self
        
        CinsiyetPw.tag = 0
        CalismaBicimiPw.tag = 1
 
        self.hideKeyboardWhenTappedAround()
        
        CinsiyetTf.attributedPlaceholder = NSAttributedString(
            string: "Seçiniz",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        KiloTf.attributedPlaceholder = NSAttributedString(
            string: "Ör. 75 yada 75.3",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        YasTF.attributedPlaceholder = NSAttributedString(
            string: "Ör. 25",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        BoyTf.attributedPlaceholder = NSAttributedString(
            string: "Ör. 180",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        CalismaBicimiTf.attributedPlaceholder = NSAttributedString(
            string: "Seçiniz",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
    }
  
    
    @IBAction func KaloriHesapla_TUI(_ sender: Any) {
        let cinsiyet = String(CinsiyetTf.text!)
        let calismaBicimi = String(CalismaBicimiTf.text!)
        let yas = Float(YasTF.text!) ?? 0.0
        let boy = Float(BoyTf.text!) ?? 0.0
        let kg = Float(KiloTf.text!) ?? 0.0
        let index = CalismaBicimiListe.firstIndex(of: calismaBicimi)
        Kalori.KaloriniHesapla(cinsiyet: cinsiyet, calismaBicimi: index!, yas: yas, boy: boy, kg: kg)
        performSegue(withIdentifier: "KalorisSeg", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "KalorisSeg" {
            let destinationVc = segue.destination as! KaloriCalculatedVc
            destinationVc.Value = Kalori.getKaloriValue()
            
        }
    }
}

extension KaloriVc: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return CinsiyetList.count
        case 1:
            return CalismaBicimiListe.count
        default:
            return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
            return CinsiyetList[row]
        case 1:
            return CalismaBicimiListe[row]
        default:
            return "Not found"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            CinsiyetTf.text = CinsiyetList[row]
            CinsiyetTf.resignFirstResponder()
        case 1:
            CalismaBicimiTf.text = CalismaBicimiListe[row]
            CalismaBicimiTf.resignFirstResponder()
        default:
            return
        }
    }
    
}
