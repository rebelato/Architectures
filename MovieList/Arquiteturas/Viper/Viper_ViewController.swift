//
//  Viper_ViewController.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 17/05/21.
//

import UIKit

class Viper_ViewController: UIViewController {
    
    internal let navigationTitle: String
    internal var presenter: ViewToPresenterProtocol?
    
    internal var dataSource: [Movie] {
        didSet {
            updateView()
        }
    }

    internal init(title: String) {
        dataSource = []
        navigationTitle = title
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    internal required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal override func loadView() {
        let view = MVC_View(frame: .zero)
        view.listView.tableView.dataSource = self
        view.listView.tableView.delegate = self
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = navigationTitle
        loadData()
    }
    
    private func loadData() {
        presenter?.getMovies()
    }
    
    private func updateView() {
        if let view = view as? MVC_View {
            view.updateView()
        }
    }

}

extension Viper_ViewController: PresenterToViewProtocol {
    
    internal func showMovies(movies: [Movie]) {
        dataSource = movies
    }
    
}

extension Viper_ViewController: UITableViewDataSource {
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: nil)
        
        let movie = dataSource[indexPath.row]
        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.text = "Popularidade: \(movie.popularity)"
        return cell
    }
    
}

extension Viper_ViewController: UITableViewDelegate {
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let navigation = navigationController else {
            return
        }
        
        let movie = dataSource[indexPath.row]
        presenter?.showDetailViewController(movie: movie, navigationController: navigation)
    }
    
}

