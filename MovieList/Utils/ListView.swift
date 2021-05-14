//
//  ListView.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 14/05/21.
//

import UIKit

internal class ListView: UIView {

    internal let tableView: UITableView

    internal override init(frame: CGRect) {
        tableView = UITableView()
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    internal required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func updateView() {
        tableView.reloadData()
    }

}

extension ListView: ViewCodable {

    internal func buildHierarchy() {
        addView(tableView)
    }

    internal func buildConstraints() {
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }

    internal func render() {
        tableView.backgroundColor = .white
    }
    
}
