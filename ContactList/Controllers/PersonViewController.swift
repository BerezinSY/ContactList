//
//  PersonViewController.swift
//  ContactList
//
//  Created by BEREZIN Stanislav on 09.09.2020.
//  Copyright © 2020 BEREZIN Stanislav. All rights reserved.
//

import UIKit

class PersonViewController: UITableViewController {
    
    var persons: [Person]!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "person", for: indexPath)
        let person = persons[indexPath.row]
        cell.textLabel?.text = person.fullName
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let detailVC = segue.destination as? DetailViewController,
            let selectedPerson = tableView.indexPathForSelectedRow?.row
            else { return }
        detailVC.person = persons[selectedPerson]
    }
}
