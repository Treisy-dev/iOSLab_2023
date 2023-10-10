//
//  ShopModel.swift
//  CW_1
//
//  Created by Кирилл Щёлоков on 10.10.2023.
//

import Foundation
import UIKit

class ShopModel{
    var carsDataSource: [Car] = [
        Car(id: UUID(), model: "Невероятно красивая безцветная машина", price: "$10000", image: UIImage(named: "WhiteCar")),
        Car(id: UUID(), model: "Очень быстрый крассный супер-кар", price: "$20000", image: UIImage(named: "RedCar")),
        Car(id: UUID(), model: "Ну так чисто машинка потаксовать", price: "$30000", image: UIImage(named: "YellowCar"))
    ]
    
//    var cart: [Car] = []
}
