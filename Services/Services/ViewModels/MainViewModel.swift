//
//  MainViewModel.swift
//  Services
//
//  Created by Кирилл Давыденков on 30.03.2024.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[MainCellViewModel]> = Observable(nil)
    var dataSource: [Services]?
    
    func numberOfSection() -> Int {
        1
    }
    
    func numbersOfRows(_ section: Int) -> Int {
        dataSource?.count ?? 0
    }
    
    func getServices() {
        isLoading.value = true
        
        NetworkDataFetch.shared.fetchServices { [weak self] services, error in
            guard let self else { return }
            self.isLoading.value = false
            if let services {
                self.dataSource = services
                mapCellData()
            }
        }
    }
    
    func mapCellData() {
        cellDataSource.value = dataSource?.compactMap({ MainCellViewModel($0) })
    }
    
}
