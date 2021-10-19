//
//  ViewModel.swift
//  MVVM-2
//
//  Created by Sergey Lobanov on 19.10.2021.
//

import Foundation

class ViewModel: TableViewViewModelType {

    private var selectedIndexPath: IndexPath?
    
    var profiles = [
        Profile(name: "John", secondName: "Smith", age: 33),
        Profile(name: "Max", secondName: "Falley", age: 21),
        Profile(name: "Mark", secondName: "Cardy", age: 55)]

    func numberOfRows() -> Int {
        return profiles.count
    }

    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        // наша задача просто передать профиль дальше, и уже дальше новая вью модель с ним работает
        let profile = profiles[indexPath.row]
        return TableViewCellViewModel(profile: profile)
    }

    func viewModelForSelectedRow() -> DetailViewModelType? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        return DetailViewModel(profile: profiles[selectedIndexPath.row])
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
}
