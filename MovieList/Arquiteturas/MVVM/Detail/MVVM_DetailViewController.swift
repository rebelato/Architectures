//
//  MVVM_DetailViewController.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 14/05/21.
//

import UIKit

class MVVM_DetailViewController: UIViewController {
    
    let movie: Movie
    let service: ServiceProtocol

    internal init(movie: Movie, service: ServiceProtocol = Service()) {
        self.service = service
        self.movie = movie
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
        service.getImageMovie(with: movie.poster_path) { result in
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
            view.viewModel = MVVM_DetailViewModel(movie: movie, image: image)
        }
    }

}
