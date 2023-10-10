//
//  ShopViewController.swift
//  CW_1
//
//  Created by Кирилл Щёлоков on 10.10.2023.
//

import Foundation
import UIKit

class ShopViewController: UIViewController{
    
    private var shopView: ShopView!
    private var shopModel: ShopModel!
    private var shopDataManager: ShopDataManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shopModel = ShopModel()
        shopDataManager = ShopDataManager(shopModel: shopModel)
        setUpNavigationBar()
        setupShopView()

    }
    
    private func setUpNavigationBar(){
        navigationController?.isNavigationBarHidden = false
        navigationItem.title = "Машины"
        
        let busketBarItemAction = UIAction() { [weak self] _ in
            self?.navigationController?.pushViewController(BusketViewController(cars: BusketModel.busket), animated: true)
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "BusketIcon"), primaryAction: busketBarItemAction, menu: nil) // КАРТИНКА!!!!
    }
    
    private func setupShopView() {
        shopView = ShopView(frame: view.bounds)
        shopView.tableView.delegate = shopDataManager
        shopView.tableView.dataSource = shopDataManager
        shopView.tableView.register(CarTableViewCell.self, forCellReuseIdentifier: CarTableViewCell.reuseIdentifier)
        view = shopView
    }
}

