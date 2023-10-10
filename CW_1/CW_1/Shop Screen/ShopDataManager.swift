//
//  DataManager.swift
//  CW_1
//
//  Created by Кирилл Щёлоков on 10.10.2023.
//

import Foundation
import UIKit

class ShopDataManager: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var shopModel: ShopModel
    

    init(shopModel: ShopModel) {
        self.shopModel = shopModel
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopModel.carsDataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let car = shopModel.carsDataSource[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.reuseIdentifier, for: indexPath) as! CarTableViewCell
        
        cell.addButtonTaped = {
            BusketModel.busket.append(Car(id: UUID(), model: car.model, price: car.price, image: car.image))
        }
        
        
        cell.configure(with: car)
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
