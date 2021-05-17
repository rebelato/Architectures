//
//  Viper_DetailViewController.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 17/05/21.
//

import UIKit

class Viper_DetailViewController: UIViewController {
    
    internal let dataSource: Movie
    internal var presenter: DetailViewToPresenterProtocol?

    internal init(movie: Movie) {
        dataSource = movie
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    internal required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal override func loadView() {
        view = MVVM_DetailView(frame: .zero)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        presenter?.showMovie(movie: dataSource)
    }
    
    private func updateView(movie: Movie) {
        if let view = view as? MVVM_DetailView {
            view.titleLabel.text = movie.title
            view.overviewLabel.text = movie.overview
        }
    }

}

extension Viper_DetailViewController: DetailPresenterToViewProtocol {
    
    internal func showMovie(movie: Movie) {
        updateView(movie: movie)
    }
    
}
