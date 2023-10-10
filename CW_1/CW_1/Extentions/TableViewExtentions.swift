//
//  Extentions.swift
//  CW_1
//
//  Created by Кирилл Щёлоков on 10.10.2023.
//

import Foundation
import UIKit

extension UITableViewCell{
    static var reuseIdentifier : String {
        return String(describing: self)
    }
}
