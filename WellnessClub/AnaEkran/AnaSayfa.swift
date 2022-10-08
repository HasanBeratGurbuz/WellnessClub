//
//  AnaSayfa.swift
//  WellnessClub
//
//  Created by Hasan Gürbüz on 16.09.2022.
//

import UIKit

class AnaSayfa: UIViewController, UITableViewDataSource, UITableViewDelegate {
   

    @IBOutlet weak var TVCMain: UITableView!
    
    
    let katagoriListe = ["Hakkımızda","Etkinlikler","Anlaşmalar","Yönetim Kurulu","Galeri","Fit Tarifler"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Bilgi Wellness Club"
        let nibName = UINib(nibName: "KatagoriTVC", bundle: nil)
        TVCMain.register(nibName, forCellReuseIdentifier: "KatagoriCell")
        

        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
     
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return katagoriListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "KatagoriCell",for: indexPath) as! KatagoriTVC
        
        cell.commonInit(katagoriListe[indexPath.item])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Hakkimizda = HakkimizVc()
        let Etkinlik = EtkinlikVc()
        
        
        if indexPath.item == 0 {
            Hakkimizda.commonInit(katagoriListe[indexPath.item])
            self.navigationController?.pushViewController(Hakkimizda, animated: true)
        }else {
            //Etkinlik.commonInit(katagoriListe[indexPath.item], text: katagoriListe[indexPath.item])
            self.navigationController?.pushViewController(Etkinlik, animated: true)
        }
    }
}
 








    /*
    var katagoriListe : [KatagoriListesi] = []
    @IBOutlet weak var TV_KatagoriList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        katagoriListe.append(KatagoriListesi(tag: "Hakkımızda"))
        katagoriListe.append(KatagoriListesi(tag: "Etkinlikler"))
        katagoriListe.append(KatagoriListesi(tag: "Anlaşmalar"))
        katagoriListe.append(KatagoriListesi(tag: "Yönetim Kurulu"))
        katagoriListe.append(KatagoriListesi(tag: "Galeri"))
        katagoriListe.append(KatagoriListesi(tag: "Fit Tarifler"))
       
        TV_KatagoriList.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return katagoriListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TVC_AnaEkran", owner: self, options: nil)?.first as! TVC_AnaEkran
        
        let liste = katagoriListe[indexPath.row]
        
        if liste.Cesit == "Hakkımızda"{
            cell.btn_Katagori.backgroundColor = .green
        }else if liste.Cesit == "Etkinlikler"{
            cell.btn_Katagori.backgroundColor = .yellow
        }else if liste.Cesit == "Anlaşmalar"{
            cell.btn_Katagori.backgroundColor = .blue
        }else if liste.Cesit == "Yönetim Kurulu"{
            cell.btn_Katagori.backgroundColor = .black
        }else if liste.Cesit == "Galeri"{
            cell.btn_Katagori.backgroundColor = .clear
        }else{
            cell.btn_Katagori.backgroundColor = .purple
        }
        
            return cell
        } */
        

