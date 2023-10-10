//
//  CarTableViewCell.swift
//  CW_1
//
//  Created by Кирилл Щёлоков on 10.10.2023.
//

import UIKit

protocol BusketTableViewCellDelegate: AnyObject {
    func didDeleteCar(car: Car)
}

class BusketTableViewCell: UITableViewCell {
    
    weak var delegate: BusketTableViewCellDelegate?
    
    private lazy var cellImageView : UIImageView = {
        let cellImageView = UIImageView()
        return cellImageView
    }()
    
    private lazy var nameLabel : UILabel = {
        let nameLabel = UILabel()
        return nameLabel
    }()
    
    private lazy var costLabel : UILabel = {
        let costLabel = UILabel()
        return costLabel
    }()
    
    private lazy var deleteButton : UIButton = {
        let deleteButton = UIButton()
        return deleteButton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(){
        setUpCellImageView()
        setUpNameLabel()
        setUpCostLabel()
        setUpRemoveButton()
    }
    
    func configure(with car : Car){
        cellImageView.image = car.image
        costLabel.text = car.price
        nameLabel.text = car.model
        
        let deleteAction = UIAction { _ in
            self.delegate?.didDeleteCar(car: car)
        }
        
        deleteButton.addAction(deleteAction, for: .touchUpInside)
    }
    
    private func setUpCellImageView(){
        contentView.addSubview(cellImageView)
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cellImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cellImageView.widthAnchor.constraint(equalToConstant: 80),
            cellImageView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func setUpNameLabel(){
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont.systemFont(ofSize: 14)

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            nameLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
        ])
    }
    
    private func setUpCostLabel(){
        contentView.addSubview(costLabel)
        costLabel.translatesAutoresizingMaskIntoConstraints = false
        costLabel.textColor = .gray
        costLabel.font = UIFont.systemFont(ofSize: 12)

        
        NSLayoutConstraint.activate([
            costLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            costLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 8),
        ])
    }
    
    private func setUpRemoveButton(){
        contentView.addSubview(deleteButton)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.setImage(UIImage(named: "CrossIcon"), for: .normal)
        deleteButton.layer.cornerRadius = 2
        deleteButton.layer.borderWidth = 1
        deleteButton.layer.borderColor = UIColor.gray.cgColor
        
        
        NSLayoutConstraint.activate([
            deleteButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            deleteButton.widthAnchor.constraint(equalToConstant: 30),
            deleteButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}

