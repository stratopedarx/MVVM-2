//
//  DetailViewModel.swift
//  MVVM-2
//
//  Created by Sergey Lobanov on 19.10.2021.
//

import Foundation

class DetailViewModel: DetailViewModelType {
    private var profile: Profile

    var description: String {
        return String(describing: "\(profile.name) \(profile.secondName) is \(profile.age) old.")
    }

    var age: Box<String?> = Box(nil)

    init(profile: Profile) {
        self.profile = profile
    }
}
