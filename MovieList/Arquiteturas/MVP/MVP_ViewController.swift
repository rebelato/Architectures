//
//  MVP_ViewController.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 14/05/21.
//

import UIKit

class MVP_ViewController: UIViewController {
    
    internal let navigationTitle: String
    
    internal var dataSource: [Movie] {
        didSet {
            updateView()
        }
    }
    
    private var presenter: MVP_PresenterProtocol?

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
        configurePresenter()
        loadData()
    }
    
    private func configurePresenter() {
        presenter = MVP_Presenter(service: Service())
        presenter?.delegate = self
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

extension MVP_ViewController: MVP_PresenterDelegate {
    
    internal func render(movies: [Movie]) {
        dataSource = movies
    }
    
}

extension MVP_ViewController: UITableViewDataSource {
    
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

extension MVP_ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = dataSource[indexPath.row]
        let detailVC = MVC_DetailViewController(movie: movie)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

