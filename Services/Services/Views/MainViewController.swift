//
//  MainViewController.swift
//  Services
//
//  Created by Кирилл Давыденков on 30.03.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    let mainTableView: UITableView = {
        let mainTableView = UITableView()
        mainTableView.backgroundColor = .black
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        return mainTableView
    }()
    
    let activityIndicator = UIActivityIndicatorView()
    
    var viewModel = MainViewModel()
    
    var cellDataSource = [MainCellViewModel]()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getServices()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        bindViewModel()
    }
    
    private func setupViews() {
        view.backgroundColor = .black
        setupTitle()
        
        view.addSubview(mainTableView)
        setupMainTableView()
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
    }
    
    private func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self, let isLoading else { return }
            DispatchQueue.main.async {
                isLoading ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] services in
            guard let self, let services else { return }
            cellDataSource = services
            reloadTableView()
            
        }
    }
}

extension MainViewController {
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupTitle() {
        let titleLabel = UILabel()
        titleLabel.text = "Сервисы"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.titleView = titleLabel
    }
}
