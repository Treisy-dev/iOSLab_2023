//
//  PostsView.swift
//  homework_6
//
//  Created by Кирилл Щёлоков on 29.10.2023.
//

import UIKit

class PostsView: UIView {

    lazy var tableView: UITableView = UITableView()

    lazy var postSearchBar: UISearchBar = UISearchBar()

    private var indexPath: IndexPath

    required init(frame: CGRect, indexPath: IndexPath) {
        self.indexPath = indexPath
        super.init(frame: frame)
        backgroundColor = .white
        setUp()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        setUpSearchBar()
        setUpTableView()
    }

    private func setUpTableView() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 35),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }

    private func setUpSearchBar() {
        addSubview(postSearchBar)
        postSearchBar.translatesAutoresizingMaskIntoConstraints = false
        postSearchBar.placeholder = "Поиск по описанию"

        NSLayoutConstraint.activate([
            postSearchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            postSearchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            postSearchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            postSearchBar.heightAnchor.constraint(equalToConstant: 25)
        ])
    }

}
