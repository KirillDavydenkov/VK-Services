//
//  MainVC TableView.swift
//  Services
//
//  Created by Кирилл Давыденков on 30.03.2024.
//

import UIKit

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setupMainTableView() {
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
        mainTableView.separatorStyle = .singleLine
        mainTableView.separatorColor = .darkGray
        
        registerCell()
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.mainTableView.reloadData()
        }
    }
    
    func registerCell() {
        mainTableView.register(MainCell.self, forCellReuseIdentifier: MainCell.identifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numbersOfRows(section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellViewModel = cellDataSource[indexPath.row]
        handleDeepLinkFor(cellViewModel.link.absoluteString)
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.identifier,
                                                       for: indexPath) as? MainCell else { return UITableViewCell() }
        let cellViewModel = cellDataSource[indexPath.row]
        cell.configureCell(viewModel: cellViewModel)
        
        return cell
    }
    
    func handleDeepLinkFor(_ link: String?) {
        guard let link = link, let url = URL(string: link) else {
            print("Invalid or empty link")
            return
        }
        
        // Открываем ссылку
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
