//
//  HakkimizVc.swift
//  WellnessClub
//
//  Created by Hasan Gürbüz on 29.09.2022.
//

import UIKit

class HakkimizVc: UIViewController {
   
    @IBOutlet weak var detailImage2: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    var imageName : String!
    var textName : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        detailImage.image = UIImage(named: self.imageName)
        detailImage2.image = UIImage(named: self.imageName)
       
    }
    func commonInit(_ imageName: String)
    {
        self.imageName = imageName
    }

}
