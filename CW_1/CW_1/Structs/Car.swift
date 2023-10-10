//
//  Car.swift
//  CW_1
//
//  Created by Кирилл Щёлоков on 10.10.2023.
//

import Foundation
import UIKit

struct Car: Equatable, Hashable, Identifiable {
    let id: UUID
    let model: String
    let price: String
    let image: UIImage?
}
