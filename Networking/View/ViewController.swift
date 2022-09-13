//
//  ViewController.swift
//  Networking
//
//  Created by Juan Diego Marin on 10/09/22.
//

import UIKit


class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let viewModel = UserViewModel()
    
   
    // MARK: - IBActions
    
    @IBAction func getUserAction(_ sender: Any) {
        viewModel.getUser(id: 3239)
    }
    
    @IBAction func addUserAction(_ sender: Any) {
        
        let newUser = NewUser(name: "Juan Diego", email: "jdm_8@colombia.com", gender: "Male", status: "Active")
        
        viewModel.addUser(user: newUser)
    }
    
    @IBAction func updateUser(_ sender: Any) {
        
        let newUser = NewUser(name: "Juan Diego", email: nil, gender: nil, status: nil)
        viewModel.updateUser(id: 3239, user: newUser)
    }
    
    @IBAction func deleteUser(_ sender: Any) {
        let id = 3239
        viewModel.deleteUser(id: id)
    }
    
    
    // MARK: - Private Methods
    
    private func setup(user: UserResponse){
        self.nameLabel.text = user.name
        self.emailLabel.text = user.email
        self.idLabel.text = user.id?.description
        
    }
    
    
    
    // MARK: - Life Cycle ViewController
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         activityIndicator.hidesWhenStopped = true
         
         viewModel.success = { [weak self] user in
             self?.setup(user: user)
         }
         viewModel.failure = { [weak self] error in
             self?.nameLabel.text = error.localizedDescription
         }
         viewModel.isLoading = { [weak self] isLoading in
             if isLoading {
                 self?.activityIndicator.startAnimating()
             } else {
                 self?.activityIndicator.stopAnimating()
             }
             
         }
         
     }
    
    
}

