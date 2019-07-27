//
//  ViewController.swift
//  JSONTableView
//
//  Created by Stephen Feuerstein on 7/27/19.
//  Copyright © 2019 Refactor Studios. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    fileprivate var people = [Person]() {
        didSet {
            // TODO: Reload table view here
            print("Reload table view")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadTestData()
    }
    
    private func loadTestData() {
        DataService.getTestData { [weak self] (people, error) in
            guard let self = self else { return }
            if let people = people {
                self.people = people
            } else if let error = error {
                print("Error loading test data: \(error.localizedDescription)")
                // TODO: Show error state
            }
        }
    }
}

