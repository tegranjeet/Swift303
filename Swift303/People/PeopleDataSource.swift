//
//  PeopleDataSource.swift
//  Swift303
//
//  Created by Eric Armstrong on 8/6/19.
//  Copyright © 2019 Eric Armstrong. All rights reserved.
//

import Foundation
import UIKit

class PeopleDataSource: NSObject {
    
    private let urlString = "http://www.filltext.com/?rows=100&fname=%7BfirstName%7D&lname=%7BlastName%7D&city=%7Bcity%7D&pretty=false"
    
    private var people = People()

    // ----------------------------------------------------------------------------
    // MARK: Internal
    // ----------------------------------------------------------------------------

    var dataSourceUpdated: ((Result<People, Error>) -> Void)?

    func requestPeople() {
        Request.get(urlString) { [weak self] (result: Result<People, Error>) in
            switch result {
            case .success(let people):
                self?.people = people
                self?.dataSourceUpdated?(result)
            case .failure:
                self?.dataSourceUpdated?(result)
            }
        }
    }
}

extension PeopleDataSource: UITableViewDataSource {
    
    // ----------------------------------------------------------------------------
    // MARK: UITableViewDataSource
    // ----------------------------------------------------------------------------

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PersonCell = tableView.dequeueCell(at: indexPath)
        cell.updatePerson(people[indexPath.row])
        return cell
    }
}
