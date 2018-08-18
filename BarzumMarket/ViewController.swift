//
//  ViewController.swift
//  BarzumMarket
//
//  Created by Nikolas Omelianov on 18.08.2018.
//  Copyright © 2018 Nikolas Omelianov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let persistanceManager : PersistanceManager
    
    init(persistanceManager: PersistanceManager) {
        self.persistanceManager = persistanceManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUser()
        getUsers()
    }

    func createUser(){
        let user = User(context: persistanceManager.context)
        user.name = "YourName"
        
        persistanceManager.save()
    }
    func getUsers() {
        let users = persistanceManager.fetch(User.self)
        users.forEach({print($0.name)})

    }
}

