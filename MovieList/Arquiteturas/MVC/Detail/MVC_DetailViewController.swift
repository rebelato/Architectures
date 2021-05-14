//
//  MVC_DetailViewController.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 14/05/21.
//

import UIKit

class MVC_DetailViewController: UIViewController {
    
    internal let dataSource: Movie

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
        updateView()
    }
    
    private func updateView() {
        if let view = view as? MVVM_DetailView {
            view.titleLabel.text = dataSource.title
            view.overviewLabel.text = dataSource.overview
        }
    }

}
