//
//  DetailViewController.swift
//  MVVM-2
//
//  Created by Sergey Lobanov on 19.10.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!

    var viewModel: DetailViewModelType?

    // используем этот метод, потому что viewDidLoad нас немного ограничивает.
    // viewDidLoad (загружется один раз)
    // viewWillAppear - отрабатывает каждый раз, когда появляется экран. Лучше подходит в этом случае.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let viewModel = viewModel else { return }
        self.textLabel.text = viewModel.description
    }
}
