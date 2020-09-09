//
//  MainTabBarController.swift
//  ContactList
//
//  Created by BEREZIN Stanislav on 09.09.2020.
//  Copyright © 2020 BEREZIN Stanislav. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let persons = Person.getPersons()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers(with: persons)
    }
    
    private func setupViewControllers(with data: [Person]) {
        guard
            let personVC = viewControllers?.first as? PersonViewController,
            let contactVC = viewControllers?.last as? ContactViewController
            else { return }
        personVC.persons = data
        contactVC.persons = data
    }
}
