//
//  File.swift
//  CW_1
//
//  Created by Кирилл Щёлоков on 10.10.2023.
//

import Foundation
import UIKit

class ShopView: UIView {
    
    lazy var tableView: UITableView = UITableView()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setUp()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(){
        setUpTableView()
    }
    
    
    private func setUpTableView(){
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
}


