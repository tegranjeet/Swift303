//
//  PeopleViewController.swift
//  Swift303
//
//  Created by Eric Armstrong on 8/6/19.
//  Copyright © 2019 Eric Armstrong. All rights reserved.
//

import Foundation
import UIKit

class PeopleViewController: UIViewController {
    
    // ----------------------------------------------------------------------------
    // MARK: State
    // ----------------------------------------------------------------------------

    enum State {
        case waiting, loading, updated, error(Error)
    }
    
    private var state = State.waiting {
        didSet {
            stateUpdated(state)
        }
    }
    
    // ----------------------------------------------------------------------------
    // MARK: Data Source
    // ----------------------------------------------------------------------------

    private let peopleDataSource = PeopleDataSource()
    
    // ----------------------------------------------------------------------------
    // MARK: UI Elements
    // ----------------------------------------------------------------------------

    private let activityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
    private let tableView = UITableView(frame: .zero, style: .plain)
    private let errorLabel = UILabel {
        $0.textColor = .white
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    
    // ----------------------------------------------------------------------------
    // MARK: UIViewController
    // ----------------------------------------------------------------------------

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = peopleDataSource
        tableView.registerCell(PersonCell.self)
        
        view.addSubview(activityIndicatorView)
        view.addSubview(tableView)
        view.addSubview(errorLabel)
        
        peopleDataSource.dataSourceUpdated = { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self?.state = .updated
                case .failure(let error):
                    self?.state = .error(error)
                }
            }
        }
        peopleDataSource.requestPeople()
        
        state = .loading
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.frame
        errorLabel.frame = view.frame
        activityIndicatorView.frame = view.frame
    }
    
    // ----------------------------------------------------------------------------
    // MARK: Private
    // ----------------------------------------------------------------------------
    
    private func stateUpdated(_ state: State) {
        switch state {
        case .waiting:
            tableView.isHidden = true
            errorLabel.isHidden = true
            activityIndicatorView.isHidden = true
        case .loading:
            tableView.isHidden = true
            errorLabel.isHidden = true
            activityIndicatorView.isHidden = false
            activityIndicatorView.startAnimating()
        case .updated:
            tableView.isHidden = false
            errorLabel.isHidden = true
            activityIndicatorView.isHidden = true
            activityIndicatorView.stopAnimating()
            tableView.reloadData()
        case .error(let error):
            tableView.isHidden = true
            errorLabel.isHidden = false
            errorLabel.text = error.localizedDescription
            errorLabel.sizeToFit()
            activityIndicatorView.isHidden = true
            activityIndicatorView.stopAnimating()
        }
    }
}
