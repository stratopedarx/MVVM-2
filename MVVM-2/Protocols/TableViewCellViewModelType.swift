//
//  TableViewCellViewModelType.swift
//  MVVM-2
//
//  Created by Sergey Lobanov on 19.10.2021.
//

import Foundation

protocol TableViewCellViewModelType: AnyObject {
    var fullName: String { get }
    var age: String { get }
}
