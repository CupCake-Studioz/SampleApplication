//
//  BottomTabBarModel.swift
//  SampleApplication
//
//  Created by Shubham Shukla on 20/05/21.
//

import Foundation
import UIKit

struct BottomTabBarModel {
    
    var title: String?
    var image: UIImage?
    var action: Actions?
    var additionalData : Any?
}

enum Actions{

    case More
    case Less
    case None
    case Controller

}
