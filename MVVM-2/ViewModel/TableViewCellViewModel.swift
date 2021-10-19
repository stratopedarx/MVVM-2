//
//  ViewModelCell.swift
//  MVVM-2
//
//  Created by Sergey Lobanov on 19.10.2021.
//

import Foundation

// для заполнения ячейки, а не всей таблицы
class TableViewCellViewModel: TableViewCellViewModelType {
    var fullName: String {
        return profile.name + " " + profile.secondName
    }
    
    var age: String {
        return String(describing: profile.age)
    }
    
    private var profile: Profile

    init(profile: Profile) {
        self.profile = profile
    }
}
