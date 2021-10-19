//
//  TableViewController.swift
//  MVVM-2
//
//  Created by Sergey Lobanov on 18.10.2021.
//

import UIKit

class TableViewController: UITableViewController {

    private var viewModel: TableViewViewModelType?

    override func viewDidLoad() {
        super.viewDidLoad()
        // MVC style
        viewModel = ViewModel()

    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel?.numberOfRows() ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell

        guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }

        /*
         viewModel порождает другую viewModel
         так быть не должно. Должна быть собственная ViewModel. Строки ниже здесь не актуальны.
         У нашей viewModel должен быть метод, в который мы будем передавать indexPath и на основе этого должны
         возвращать новую модельку. Модельку, которая применима к нашей ячейке.
        
        let result = viewModel.profiles[indexPath.row]
        tableViewCell.fullNameLabel.text = "\(result.name) \(result.secondName)"
        tableViewCell.ageLabel.text = "\(result.age)"
         */

        // MVVM
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath) // viewModel для нашей ячейки
        tableViewCell.viewModel = cellViewModel
        
        return tableViewCell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        viewModel.selectRow(atIndexPath: indexPath)
    
        performSegue(withIdentifier: "detailSegue", sender: nil)

    }

    // надо подготовить переход, сгенерировать вью модель и передать ее на новый экран
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier, let viewModel = viewModel else { return }

        if identifier == "detailSegue" {
            if let destinationVC = segue.destination as? DetailViewController {
                destinationVC.viewModel = viewModel.viewModelForSelectedRow()
            }
        }
    }
}
