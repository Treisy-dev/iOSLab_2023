//
//  BusketViewController.swift
//  CW_1
//
//  Created by Кирилл Щёлоков on 10.10.2023.
//

import UIKit

class BusketViewController: UIViewController {
    
    private var cars: [Car]
    private var busketView: BusketView!
//    private var busketModel: BusketModel!
    private var busketDataManager: BusketDataManager!
        
    init(cars: [Car]) {
        self.cars = cars
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBusketView()
//        busketModel = BusketModel(busket: cars)
        busketDataManager = BusketDataManager( tableView: busketView.tableView)
        setupBusketTableView()
        setUpNavigationBar()
        
        
    }
    
    private func setUpNavigationBar(){
        navigationController?.isNavigationBarHidden = false
        navigationItem.title = "Корзина"
    }
    
    private func setupBusketView() {
        busketView = BusketView(frame: view.bounds)
        view = busketView
    }
    
    private func setupBusketTableView() {
        busketView.tableView.delegate = busketDataManager
        busketView.tableView.register(BusketTableViewCell.self, forCellReuseIdentifier: BusketTableViewCell.reuseIdentifier)
    }

}
