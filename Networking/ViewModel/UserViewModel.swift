//
//  UserViewModeñ.swift
//  Networking
//
//  Created by Juan Diego Marin on 13/09/22.
//

import Foundation


final class UserViewModel {
    
    // MARK: - Internal properties
    
    var success: ((_ user: UserResponse) -> Void)?
    var failure: ((_ error: Error) -> Void)?
    var isLoading : ((_ isLoading: Bool) -> Void)?
    private var model = UserModel.shared
    
    
    // MARK: - Internal Methods
    
    func getUser(id: Int) {
        self.isLoading?(true)
        model.getUser(id: id, success: { user in
            self.isLoading?(false)
            self.success?(user)
        }, failure: { error in
            self.isLoading?(false)
            self.failure?(error)
        })
    }
    
    
    func addUser(user: NewUser) {
        self.isLoading?(true)
        model.addUser(user: user, success: { user in
            self.isLoading?(false)
            self.success?(user)
        }, failure: { error in
            self.isLoading?(false)
            self.failure?(error)
        })
    }
    
    
    func updateUser(id: Int, user: NewUser) {
        self.isLoading?(true)
        model.updateUser(id: id, user: user, success: { user in
            self.isLoading?(false)
            self.success?(user)
        }, failure: { error in
            self.isLoading?(false)
            self.failure?(error)
        })
    }
    
    
    func deleteUser(id: Int) {
        self.isLoading?(true)
        model.deleteUser(id: id, success: { user in
            self.isLoading?(false)
            self.success?(user)
        }, failure: { error in
            self.isLoading?(false)
            self.failure?(error)
        })
    }
    
}
