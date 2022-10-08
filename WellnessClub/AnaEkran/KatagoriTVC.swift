//
//  KatagoriTVC.swift
//  WellnessClub
//
//  Created by Hasan Gürbüz on 16.09.2022.
//

import UIKit

class KatagoriTVC: UITableViewCell {

    @IBOutlet weak var KatagoriResmi: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func commonInit(_ imageName : String){
        KatagoriResmi.image = UIImage(named: imageName)
        
    }
    
}
