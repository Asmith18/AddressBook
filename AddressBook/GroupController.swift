//
//  GroupController.swift
//  AddressBook
//
//  Created by adam smith on 1/24/22.
//

import Foundation

class GroupController {
    
//MARK: - Properties
    static let sharedInstance = GroupController()
    var groups: [Group] = []
    
 //MARK: - Initializer
    init() {
        loadContactsFromDisk()
    }
    //MARK: - CRUD Functions
    func createGroup(name: String = "untitled Group", people: [Person] = []) {
        // made new group
        let newGroup = Group(name: name, people: people)
        //adding group to the list :P
        groups.append(newGroup)
    }
    
    func updateGroup(group: Group, name: String, people: [Person]) {
        group.name = name
        group.people = people
    }
    
    func deleteGroup(group: Group) {
        guard let index = groups.firstIndex(of: group) else {return}
        groups.remove(at: index)
    }
    
    func saveContactsToDisk() {
        //1. get the address to save the file to
        guard let url = fileURL else {return}
        do {
            //2. convert the swift struct or class into raw data
            let data = try JSONEncoder().encode(groups)
            //3. save the data to the adrress from step 1
            try data.write(to: url)
        } catch let error {
            print(error)
        }
    }
    
    func loadContactsFromDisk() {
        //1. get the address your data is saved to
        guard let url = fileURL else {return}
        do {
            //2. load the data from the address
            let data = try Data(contentsOf: url)
            //3. decode the data into our swift model project
            let categories = try JSONDecoder().decode([Group].self, from: data)
            self.groups = categories
        } catch let error {
            print(error)
        }
    }
    private var fileURL: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let url = documentsDirectory.appendingPathComponent("addressbook.json")
        return url
    }
}

