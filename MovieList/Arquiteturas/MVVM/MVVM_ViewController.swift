//
//  MVVM_ViewController.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 14/05/21.
//

import UIKit

class MVVM_ViewController: UIViewController {
    
    let navigationTitle: String

    internal init(title: String) {
        navigationTitle = title
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    internal required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal override func loadView() {
        view = MVVM_View(frame: .zero)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = navigationTitle
        loadData()
    }
    
    private func loadData() {
        Service().getPopularMovies { result in
            switch result {
            case .success(let movie):
                DispatchQueue.main.async {
                    self.updateView(with: movie.results)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func updateView(with movies: [Movie]) {
        if let view = view as? MVVM_View {
            view.viewModel = MVVM_ViewModel(moviesList: movies) { movie in
                self.coordinator?.handleEvent(with: MVVMEvent.detail(movie: movie))
            }
        }
    }

}

