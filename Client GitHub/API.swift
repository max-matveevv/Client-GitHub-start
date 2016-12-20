//
//  AuthData.swift
//  Client GitHub
//
//  Created by Mikhail on 30.11.16.
//  Copyright © 2016 Max. All rights reserved.
//

import UIKit
import Alamofire
import Gloss

class API {
    static let sharedInstance = API()
    
    fileprivate let API_URL = "https://api.github.com"
    
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
    
    func login(user: String,
               password: String,
               completion: @escaping (Bool) -> ()) {
        let credentialsStr = String(format: "%@:%@", user, password)
        guard let credentialsData = credentialsStr.data(
            using: String.Encoding.utf8)?.base64EncodedString() else {
                signOut()
            completion(false)
            return
        }
        
        let authString = String(format: "Basic %@", credentialsData)
        Alamofire.request(API_URL + "/user",
                          method: .get,
                          parameters: nil,
                          encoding: URLEncoding.default,
                          headers: ["Authorization": authString])
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
    
    func httpRequest(
        url: String,
        method: HTTPMethod,
        parameters: Parameters?,
        headers: HTTPHeaders?,
        completion: @escaping (_ json: Any, _ error: Error?) -> ()) {
        
        var httpHeaders = headers
        if httpHeaders == nil {
            httpHeaders = authHeader
        }
        
        let reqUrl = API_URL + url//"https://api.github.com/users/kdavydov31/repos"
        Alamofire.request(reqUrl,
                          method: method,
                          parameters: parameters,
                          encoding: URLEncoding.default,
                          headers: httpHeaders).responseJSON { (response) in
                            completion(response.result.value, response.result.error)
        }
    }
    
    func getRepos(completion: @escaping (_ reposList: [Repository]?, _ error: Error?) -> ()) {
        httpRequest(url: "/user/repos",
                    method: .get,
                    parameters: nil,
                    headers: nil) { (data, err) in
                        if let json = data as? [JSON] {
                            var reposList = [Repository].from(jsonArray: json)
                            completion(reposList, nil)
                        } else {
                            completion(nil, err)
                        }
        }
    }
    
    func getCommit(completion: @escaping (_ reposList: [Repository]?, _ error: Error?) -> ()) {
        httpRequest(url: "/repos/:owner/:repo/commits",
                    method: .get,
                    parameters: nil,
                    headers: nil) { (data, err) in
                        if let json = data as? [JSON] {
                            var reposList = [Repository].from(jsonArray: json)
                            completion(reposList, nil)
                        } else {
                            completion(nil, err)
                        }
        }
    }
    func signOut() {
        _userName = nil
        _authString = nil
    }
}
