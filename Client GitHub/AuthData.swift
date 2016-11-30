//
//  AuthData.swift
//  Client GitHub
//
//  Created by Mikhail on 30.11.16.
//  Copyright © 2016 Max. All rights reserved.
//

import UIKit
import Alamofire

class AuthData {
    static let sharedInstance = AuthData()
    
    private var _userName: String?
    private var _authString: String?
    
    var userName: String? {
        get {
            return _userName
        }
    }
    
    var authString: String? {
        get {
            return _authString
        }
    }
    
    var authHeader: HTTPHeaders? {
        get {
            if let authString = authString {
                return ["Authorization": authString]
            }
            return nil
        }
    }
    
    var isLoggedIn: Bool {
        get {
            return _userName != nil
        }
    }
    
    private init() {
        
    }
    
    func login(user: String, password: String, completion: @escaping (Bool) -> ()) {
        let credentialsStr = String(format: "%@:%@", user, password)
        guard let credentialsData = credentialsStr.data(using: String.Encoding.utf8)?.base64EncodedString() else {
            signOut()
            completion(false)
            return
        }
        
        let authString = String(format: "Basic %@", credentialsData)
        Alamofire.request("https://api.github.com/user", method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["Authorization": authString])
            .responseJSON { response in
                if response.response?.statusCode == 200 {
                    self._userName = user
                    self._authString = authString
                    completion(true)
                } else {
                    self.signOut()
                    completion(false)
                }
        }
    }
    
    func signOut() {
        _userName = nil
        _authString = nil
    }
}
