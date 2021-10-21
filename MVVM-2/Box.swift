//
//  Box.swift
//  MVVM-2
//
//  Created by Sergey Lobanov on 21.10.2021.
//

import Foundation

// класс обертка
class Box<T> {
    typealias Listener = (T) -> ()
    // что бы добавить наблюдателя, надо сначала создать его в качестве свойства
    var listener: Listener? // наблюдатель
    
    // за этим свойством будет происходить наблюдение
    var value: T {
        didSet {
            // как только меняется value, мы в listener передаем наше значение
            listener?(value)
        }
    }
    init(_ value: T) {
        self.value = value
    }

    // связываем свойство и наблюдателя
    func bind(listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }
}
