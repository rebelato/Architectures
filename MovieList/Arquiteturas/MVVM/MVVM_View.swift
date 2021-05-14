//
//  MVVM_View.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 14/05/21.
//

import UIKit

internal class MVVM_View: UIView {
    
    internal var viewModel: MVVM_ViewModelProtocol? {
        didSet {
            updateView()
        }
    }

    internal let listView: ListView

    internal override init(frame: CGRect) {
        listView = ListView(frame: frame)
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    internal required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateView() {
        listView.updateView()
    }

}

extension MVVM_View: ViewCodable {
    
    internal func configure() {
        listView.tableView.delegate = self
        listView.tableView.dataSource = self
    }
    
    internal func buildHierarchy() {
        addView(listView)
    }

    internal func buildConstraints() {
        listView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        listView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        listView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        listView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }

    internal func render() {
        listView.backgroundColor = .white
    }
    
}

extension MVVM_View: UITableViewDataSource {
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows ?? 0
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: nil)
        guard let viewModel = viewModel else {
            return cell
        }
        
        let movie = viewModel.movies[indexPath.row]
        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.text = "Popularidade: \(movie.popularity)"
        return cell
    }
    
}

extension MVVM_View: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else {
            return
        }
        
        let movie = viewModel.movies[indexPath.row]
        viewModel.didAction(movie)
    }
    
}
