//
//  ViewController.swift
//  JSONTableView
//
//  Created by Stephen Feuerstein on 7/27/19.
//  Copyright © 2019 Refactor Studios. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var errorLabel: UILabel!
    
    fileprivate var people = [Person]() {
        didSet {
            reloadTableView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadTestData()
    }
    
    // MARK: - Data Loading
    
    private func loadTestData() {
        tableView.alpha = 0.0
        hideErrorState()
        activityIndicator.startAnimating()
        
        DataService.getTestData { [weak self] (people, error) in
            guard let self = self else { return }
            defer { self.activityIndicator.stopAnimating() }
            
            if let people = people {
                self.people = people
            } else if let error = error {
                print("Error loading test data: \(error.localizedDescription)")
                self.showErrorState()
                self.people = []
            }
        }
    }
    
    private func reloadTableView() {
        tableView.reloadData()
        if errorLabel.isHidden {
            // No error, fade in the tableview
            UIView.animate(withDuration: 0.3) {
                self.tableView.alpha = 1.0
            }
        }
    }
    
    // MARK: - Error State
    
    private func showErrorState() {
        errorLabel.isHidden = false
    }
    
    private func hideErrorState() {
        errorLabel.isHidden = true
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PersonTableViewCell.self), for: indexPath) as! PersonTableViewCell
        let person = people[indexPath.row]
        cell.setup(withPerson: person)
        return cell
    }
}

