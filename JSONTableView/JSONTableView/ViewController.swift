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
    
    fileprivate var people = [Person]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadTestData()
    }
    
    // MARK: - Data Loading
    
    private func loadTestData() {
        hideErrorState()
        
        DataService.getTestData { [weak self] (people, error) in
            guard let self = self else { return }
            
            if let people = people {
                self.people = people
            } else if let error = error {
                print("Error loading test data: \(error.localizedDescription)")
                self.people = []
                self.showErrorState()
            }
        }
    }
    
    // MARK: - Error State
    
    private func showErrorState() {
        
    }
    
    private func hideErrorState() {
        
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

