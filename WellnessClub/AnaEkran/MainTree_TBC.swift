//
//  MainTree_TBC.swift
//  WellnessClub
//
//  Created by Hasan Gürbüz on 14.09.2022.
//

import UIKit

class MainTree_TBC: UITabBarController {

    @IBOutlet weak var Btn3: UIButton!
    @IBOutlet weak var Btn2: UIButton!
    @IBOutlet weak var Btn1: UIButton!
    @IBOutlet var TabbarView: UIView!
    let Picked = UIImage(named: "house")
    let NotPicked = UIImage(named: "house.fill")
    let Picked2 = UIImage(named: "ruler")
    let NotPicked2 = UIImage(named: "ruler.fill")
    let Picked3 = UIImage(named: "person.crop.circle")
    let NotPicked3 = UIImage(named: "person.crop.circle.fill")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(TabbarView)
        
        TabbarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            TabbarView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            TabbarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            TabbarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            TabbarView.heightAnchor.constraint(equalToConstant: 80)
        ])
        Degistir(tabIndex: 0)
    }
    @IBAction func SwitchMain_TUI(_ sender: UIButton) {
        let index = sender.tag
        Degistir(tabIndex: index)
        
    }
    
    func Degistir(tabIndex :Int){
        
        Btn1.setImage(Picked, for: .normal)
        Btn2.setImage(Picked2, for: .normal)
        Btn3.setImage(Picked3, for: .normal)
        
        
        
    switch tabIndex {
        case 0:
            Btn1.setImage(NotPicked, for: .normal)
        case 1:
            Btn2.setImage(NotPicked2, for: .normal)
        case 2:
            Btn3.setImage(NotPicked3, for: .normal)
        default:
            Btn1.setImage(Picked, for: .normal)
        }
        
        selectedIndex = tabIndex
    }
    
    
    
}



extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
