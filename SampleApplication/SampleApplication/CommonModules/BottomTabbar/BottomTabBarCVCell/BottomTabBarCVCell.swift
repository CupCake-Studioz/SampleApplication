//
//  BottomTabBarCVCell.swift
//  SampleApplication
//
//  Created by Shubham Shukla on 20/05/21.
//


import UIKit

class BottomTabBarCVCell: UICollectionViewCell {
    
    @IBOutlet weak var uvBack: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var ivIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setColor()
    }
    
    private func setColor(){
        uvBack.backgroundColor = UIColor.Custom_FAFAFA
        lblTitle.textColor = UIColor.Custom_2C2C2C
    }
    
    func setData(_ bottomListModel: BottomTabBarModel){
        lblTitle.text = bottomListModel.title
        ivIcon.image = bottomListModel.image
        lblTitle.textColor = UIColor.Custom_2C2C2C
    }
    
}
