//
//  MVC_DetailViewController.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 14/05/21.
//

import UIKit

class MVC_DetailViewController: UIViewController {
    
    internal let dataSource: Movie
    internal let service: ServiceProtocol

    internal init(movie: Movie, service: ServiceProtocol = Service()) {
        dataSource = movie
        self.service = service
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
        loadData()
    }
    
    private func loadData() {
        service.getImageMovie(with: "https://image.tmdb.org/t/p/original\(dataSource.poster_path)") { result in
            switch result {
            case .success(let posterMovie):
                DispatchQueue.main.async {
                    self.updateView(with: posterMovie)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func updateView(with image: UIImage?) {
        if let view = view as? MVVM_DetailView {
            view.titleLabel.text = dataSource.title
            view.overviewLabel.text = dataSource.overview
            view.posterView.image = image
        }
    }

}
