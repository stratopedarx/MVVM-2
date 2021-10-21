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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // сделали связку, но не присвоили новое значение
        viewModel?.age.bind { [unowned self] in  // предотвращаем цикл сильных ссылок
            guard let string = $0 else { return } // это первый параметр, который передается в наш сложур
            self.textLabel.text = string
        }
        
        // [unowned self] используем, потому что в противном случае не понятно как работать с viewModel
        // viewModel должна существовать пока существует контроллер
        delay(delay: 5) { [unowned self] in
            self.viewModel?.age.value = "some new value"
        }
    }
    
    // используем этот метод, потому что viewDidLoad нас немного ограничивает.
    // viewDidLoad (загружется один раз)
    // viewWillAppear - отрабатывает каждый раз, когда появляется экран. Лучше подходит в этом случае.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let viewModel = viewModel else { return }
        self.textLabel.text = viewModel.description
    }

    // этот метод позволяет нам сделать некую отсрочку блока кода
    // escaping - значит, что этот кложус может сбежать из этой области видимости
    // мы можем передать сюда какой-то внещний кложур и что бы могли это обозначить пишем escaping
    private func delay(delay: Double, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + delay) {
            closure()
        }
    }
}
