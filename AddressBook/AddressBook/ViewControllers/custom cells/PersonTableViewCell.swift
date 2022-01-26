//
//  PeopleTableViewCell.swift
//  AddressBook
//
//  Created by adam smith on 1/25/22.
//

import UIKit

protocol PersonTableViewCellDelagate: AnyObject {
    func toggleFavoriteButtonTapped(for cell: PersonTableViewCell)
    
}


class PersonTableViewCell: UITableViewCell {
//MARK: - outlets
    @IBOutlet weak var personLabelText: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    //MARK: - properties
    var person: Person? {
        didSet {
            updateViews()
        }
    }
    
    weak var delagate: PersonTableViewCellDelagate?
    
    
//MARK: - helper functions
    func updateViews(){
        guard let unwrappedPerson = person else {return}
        let favoriteImageName = unwrappedPerson.isFavorite ? "star.fill" : "star"
        let favoriteImage = UIImage(systemName: favoriteImageName)
        favoriteButton.setImage(favoriteImage, for: .normal)
        PersonContoller.toggleIsFavorite(person: unwrappedPerson)
    }
    
    //MARK: - Actions
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        delagate?.toggleFavoriteButtonTapped(for: self)
    }
}
