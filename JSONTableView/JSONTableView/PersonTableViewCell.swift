//
//  PersonTableViewCell.swift
//  JSONTableView
//
//  Created by Stephen Feuerstein on 7/27/19.
//  Copyright © 2019 Refactor Studios. All rights reserved.
//

import UIKit

final class PersonTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    /// Configures the cell to display the Person's information
    ///
    /// - Parameter person: Person whose information you would like to display
    func setup(withPerson person: Person) {
        nameLabel.text = person.formattedName()
        cityLabel.text = person.city
    }
    
    // MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        resetLabels()
    }
    
    private func resetLabels() {
        nameLabel.text = ""
        cityLabel.text = ""
    }
}
