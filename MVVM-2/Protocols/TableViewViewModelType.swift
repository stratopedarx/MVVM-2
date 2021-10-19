//
//  TableViewModelType.swift
//  MVVM-2
//
//  Created by Sergey Lobanov on 19.10.2021.
//

import Foundation

// зачем нужен протокол? Последняя буква solid. Мы строим зависимость так,
// что бы она основывалась на абстракциях, а не но контректных типах.
// Здесь мы определили набор требований, для того, что бы наш вью контроллер работал исправно с разными моделями.
protocol TableViewViewModelType {
    func numberOfRows() -> Int  // сколько рядом в tableView. Принято делать не свойством, а методом

    // var profiles: [Profile] { get }  // список объктов. Здесь эта строка не совсем корректна.

    // метод должен вернуть новую вью модель. будем использовать протокол
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType?
}
