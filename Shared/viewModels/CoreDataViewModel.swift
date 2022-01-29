//
//  CoreDataViewModel.swift
//  Build Over
//
//  Created by Dave Agyakwa on 15/01/2022.
//

import CoreData
import Foundation
import UIKit
class CoreDataViewModel: ObservableObject {
    let container: NSPersistentContainer

    @Published var savedUser: BOUser?

    init() {
        container = NSPersistentContainer(name: "BuildOverContainer")
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error Loading Local data \(error)")
            } else {
                print("Successfully loaded")
            }
        }
        fetchUser()
    }

    func fetchUser() {
        let request = NSFetchRequest<BOUser>(entityName: "BOUser")
        do {
            savedUser = try container.viewContext.fetch(request).first

        } catch {
            print("Error Fetching Data\(error)")
        }
    }

    func addUserWith(fullName: String, email: String, photoUrl: String) {
        let user = BOUser(context: container.viewContext)
        user.id = UUID()
        user.fullName = fullName
        user.email = email
        user.photoUrl = photoUrl

        saveData()
    }

    func saveData() {
        do {
            try container.viewContext.save()
            fetchUser()
        } catch {
            print("Error Saving File \(error) ")
        }
    }
}
