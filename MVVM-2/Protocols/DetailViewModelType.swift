//
//  DetailViewModelType.swift
//  MVVM-2
//
//  Created by Sergey Lobanov on 19.10.2021.
//

import Foundation

protocol DetailViewModelType {
    var description: String { get }
    var age: Box<String?> { get }  // создаем свойство, за которым будем следить
}
