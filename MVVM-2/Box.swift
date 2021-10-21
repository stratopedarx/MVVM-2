//
//  Box.swift
//  MVVM-2
//
//  Created by Sergey Lobanov on 21.10.2021.
//

import Foundation

// класс обертка
class Box<T> {
    // что бы добавить наблюдателя, надо сначала создать его в качестве свойства
    typealias Listener = (T) -> ()
    var listener: Listener? // наблюдатель должен принимать значение и потом делаем какой-то блок кода
    
    // за этим свойством будет происходить наблюдение. За ним следит наблюдатель
    var value: T {
        didSet {
            // как только меняется value, мы в listener передаем наше новое значение
            listener?(value)
        }
    }

    init(_ value: T) {
        self.value = value
    }

    // связываем свойство и наблюдателя
    func bind(listener: @escaping Listener) {
        self.listener = listener
        listener(value)  // всё будет работать и без этой строки, но мы переждаем, потому что первое значение может выпасть.
    }
}
