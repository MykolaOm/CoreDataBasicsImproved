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
    var users = [User]()
    
    init(persistanceManager: PersistanceManager) {
        self.persistanceManager = persistanceManager
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        createUser()
        getUsers()
//        saveImage()
        setView()
    }
    func setView(){
        let imageV = UIImageView(frame: self.view.frame)
        let data = persistanceManager.fetch(UserPhoto.self).first?.image
        imageV.image = UIImage(data : data as! Data)
        self.view.addSubview(imageV)
    }
    func saveImage() {
        let image = UserPhoto(context: persistanceManager.context)
        let photo = UIImage(named: "2.jpg")

        image.image = UIImageJPEGRepresentation(photo!, 1) as! NSData
//        photo
        persistanceManager.save()
    }
    func printUsers(){
        users.forEach({print($0.name)})
    }
    func createUser() {
        let user = User(context: persistanceManager.context)
        user.name = "YourName"
        persistanceManager.save()
    }
    /*
    func onAppLaunch() -> Bool{
        return UserDefaults.standard.bool(forKey: "isUsersEmpty")
    }
    func check() {
        UserDefaults.standard.set(isUsersEmpty(), forKey: "isUsersEmpty")
        UserDefaults.standard.synchronize()
    }
    func isUsersEmpty() -> Bool {
        let users = persistanceManager.fetch(User.self)
        return users.isEmpty
    }
    */
    func getUsers() {
        let users = persistanceManager.fetch(User.self)
        self.users = users
        printUsers()
//        let deadline = DispatchTime.now() + .seconds(5)
//        DispatchQueue.main.asyncAfter(deadline: deadline, execute: deleteUser)
    }
    func updateUsers() {
        let firstUser = users.first!
        firstUser.name += " - you were updated"
        persistanceManager.save()
        printUsers()
    }
    func deleteUser(){
        let firstUser = users.first!
        persistanceManager.delete(firstUser)
        printUsers()
    }
}

