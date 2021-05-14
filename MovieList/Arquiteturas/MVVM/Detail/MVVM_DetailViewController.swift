//
//  MVVM_DetailViewController.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 14/05/21.
//

import UIKit

class MVVM_DetailViewController: UIViewController {
    
    let movie: Movie

    internal init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    internal required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal override func loadView() {
        let view = MVVM_DetailView(frame: .zero)
        view.viewModel = MVVM_DetailViewModel(movie: movie)
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
    }

}
