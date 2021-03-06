//
//  PersonDetailViewController.swift
//  AddressBook
//
//  Created by Trevor Adcock on 10/12/21.
//

import UIKit

class PersonDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    
    // MARK: - Properties
    var person: Person?
    
    // MARK: - Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
        
        
    }
    
    func updateViews() {
        guard let person = person else { return }
        nameTextField.text = person.name
        addressTextField.text = person.address
    }
    
    
    // MARK: - IBActions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let person = person,
              let name = nameTextField.text,
              let address = addressTextField.text else { return }
        PersonContoller.update(person: person, name: name, address: address)
        self.navigationController?.popViewController(animated: true)
    }
    
}
