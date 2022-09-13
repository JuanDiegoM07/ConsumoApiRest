//
//  UserModel.swift
//  Networking
//
//  Created by Juan Diego Marin on 10/09/22.
//

import Foundation
import Alamofire


class UserModel {
    
    typealias success = (_ user: UserResponse) -> Void
    typealias failure = (_ error: Error) -> Void
    
    static let shared = UserModel()
    
   
    
    
    // MARK: Private properties
    
    private let kBaseUrl = "https://gorest.co.in/public/v2/"
    private let kStatusOk = 200...299
    private let kToken = "b02ac34a6a1fa065dcc3615fbba509facb49f9ab544c94bb75057fa002ce335b"
    
    
    
    func getUser(id: Int,
                  success: @escaping success,
                  failure: @escaping failure){
        let url = "\(kBaseUrl)users/\(id)"
        AF.request(url, method: .get).validate(statusCode: kStatusOk).responseDecodable (of: UserResponse.self) {
            response in
            if let user = response.value {
                success(user)
            } else {
                failure(response.error!)
            }
        }
        
    }
     
    func addUser(user: NewUser,
                  success: @escaping success,
                  failure: @escaping failure) {
        let url = "\(kBaseUrl)users"
        let headers : HTTPHeaders = [.authorization(bearerToken: kToken)]
        
        AF.request(url, method: .post, parameters: user, encoder: JSONParameterEncoder.default, headers: headers).validate(statusCode: kStatusOk).responseDecodable(of: UserResponse.self) {
            response in
            if let user = response.value, user.id != nil {
                success(user)
            } else {
                failure(response.error!)
            }
        }
    }
    
    func updateUser(id: Int, user: NewUser,
                success: @escaping success,
                failure: @escaping failure) {
        
        let url = "\(kBaseUrl)users/\(id)"
        let headers : HTTPHeaders = [.authorization(bearerToken: kToken)]
        AF.request(url, method: .put, parameters: user, encoder: JSONParameterEncoder.default, headers: headers).validate(statusCode: kStatusOk).responseDecodable(of: UserResponse.self) {
            response in
            if let user = response.value, user.id != nil {
                success(user)
            } else {
                failure(response.error!)
            }
        }
    }
    
    func deleteUser(id: Int,
                    success: @escaping success,
                    failure: @escaping failure) {
        let url = "\(kBaseUrl)users/\(id)"
        let headers : HTTPHeaders = [.authorization(bearerToken: kToken)]
        AF.request(url, method: .delete, headers: headers).validate(statusCode: kStatusOk).response { response in
            if let error = response.error {
                failure(error)
            } else {
                success(UserResponse(id: id, name: "String", email: "", gender: "", status: ""))
            }
        }
        
    }
    
}
        
