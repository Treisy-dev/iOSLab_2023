//
//  File.swift
//  CW_1
//
//  Created by Кирилл Щёлоков on 10.10.2023.
//

import Foundation
import UIKit

class BusketView: UIView {
    
    lazy var tableView: UITableView = UITableView()
    
    lazy var sumTitleLabel: UILabel = UILabel()
    
    lazy var sumLabel: UILabel = UILabel()

        
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
        setUpSumTitleLable()
        setUpSumLable()
    }
    
    
    private func setUpTableView(){
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -80),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    private func setUpSumTitleLable(){
        addSubview(sumTitleLabel)
        sumTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        sumTitleLabel.text = "Итого"
        sumTitleLabel.font = UIFont.systemFont(ofSize: 23)
        
        NSLayoutConstraint.activate([
            sumTitleLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30),
            sumTitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
        ])

    }
    
    private func setUpSumLable(){
        addSubview(sumLabel)
        sumLabel.translatesAutoresizingMaskIntoConstraints = false
        var sum: Int = 0
        for item in BusketModel.busket {
            sum += Int(item.price.replacingOccurrences(of: "$", with: ""))!
        }
        sumLabel.text = "$\(String(sum))"
        sumLabel.font = UIFont.systemFont(ofSize: 23)
        
        NSLayoutConstraint.activate([
            sumLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30),
            sumLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 80),
        ])

    }

}


