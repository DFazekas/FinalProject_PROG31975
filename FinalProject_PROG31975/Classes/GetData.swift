//
//  GetData.swift
//  Assignment4
//
//  Created by Mark Beauchamp on 11/29/18.
//  Copyright © 2018 Justine Manikan. All rights reserved.
//

import UIKit

class GetData: NSObject {
    
    var dbData : [NSDictionary]?
    var myUrl = "http://markbeauchamp.ca:5000/api/posts" as String
   
    
    enum JSONError: String, Error {
        case NoData = "ERROR: no data"
        case ConversionFailed = "ERROR: conversion from JSON failed"
    }
    
    func getPosts(){
        self.myUrl = "http://markbeauchamp.ca:5000/api/posts" as String
        jsonParser()
        
    }
    
    
    func getPeeks(){
        self.myUrl = "http://markbeauchamp.ca:5000/api/posts" as String
        jsonParser()
        
    }
    
    
    func getReplies(id:Int){
    
        let url = "http://markbeauchamp.ca:5000/api/replies?postId=\(id)"
        guard let endpoint = URL(string: url) else {
            print("Error creating endpoint")
            return
        }
        
        let request = URLRequest(url: endpoint)
        
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                
                let datastring = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print(datastring!)
                
                
                
                guard let data = data else {
                    throw JSONError.NoData
                }
                
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [NSDictionary] else {
                    
                    throw JSONError.ConversionFailed
                    
                }
                print(json)
                self.dbData = json
                
            } catch let error as JSONError {
                print(error.rawValue)
            } catch let error as NSError {
                print(error.debugDescription)
            }
            }.resume()
        
    }
    
    
    
    func like(positive:Int, post:Int){
        // Handles voting functionality.
        var url = "http://markbeauchamp.ca:5000/api/like" as String
        guard let endpoint = URL(string: url) else {
            print("Error creating endpoint")
            return
        }
        let p = String(positive)
        let i = String(post)
        let json: [String: Any] = ["like": p,"post": i]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        var request = URLRequest(url: endpoint)
        request.httpMethod = "POST"
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        // insert json data to the request
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                url = "http://markbeauchamp.ca:5000/api/getLike?id=\(post)"
                guard let endpoint = URL(string: url) else {
                    print("Error creating endpoint")
                    return
                }
                
                let request = URLRequest(url: endpoint)
                
                
                URLSession.shared.dataTask(with: request) { (data, response, error) in
                    do {
                        
                        let datastring = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                        print(datastring!)
                        
                        
                        
                        guard let data = data else {
                            throw JSONError.NoData
                        }
                        
                        guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [NSDictionary] else {
                            
                            throw JSONError.ConversionFailed
                            
                        }
                        print(json)
                        self.dbData = json
                        
                    } catch let error as JSONError {
                        print(error.rawValue)
                    } catch let error as NSError {
                        print(error.debugDescription)
                    }
                    }.resume()
              
            }
            }.resume()
        
    }
    
    
    
    func login(){
    
        let url = "http://markbeauchamp.ca:5000/api/login" as String
        guard let endpoint = URL(string: url) else {
            print("Error creating endpoint")
            return
        }
       
        let json: [String: Any] = ["email": "te@test.com","password": "testPass"]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        var request = URLRequest(url: endpoint)
        request.httpMethod = "POST"
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                let datastring = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print(datastring!)
                
                guard let data = data else {
                    throw JSONError.NoData
                }
                
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [NSDictionary] else {
                    
                    throw JSONError.ConversionFailed
                    
                }
                print(json)
                self.dbData = json
                
            } catch let error as JSONError {
                print(error.rawValue)
            } catch let error as NSError {
                print(error.debugDescription)
            }
            }.resume()
        
        
    }
    
    func sendPost(message:String, location:String){
        
        let url = "http://markbeauchamp.ca:5000/api/post" as String
        guard let endpoint = URL(string: url) else {
            print("Error creating endpoint")
            return
        }
        
        let json: [String: Any] = ["message": message,"location": location]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        var request = URLRequest(url: endpoint)
        request.httpMethod = "POST"
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                
                let datastring = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print(datastring!)
                
                
                
                guard let data = data else {
                    throw JSONError.NoData
                }
                
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [NSDictionary] else {
                    
                    throw JSONError.ConversionFailed
                    
                }
                print(json)
                self.dbData = json
                
            } catch let error as JSONError {
                print(error.rawValue)
            } catch let error as NSError {
                print(error.debugDescription)
            }
            }.resume()
        
        
    }
    
    func sendReply(message:String, postId:String){
        
        let url = "http://markbeauchamp.ca:5000/api/reply" as String
        guard let endpoint = URL(string: url) else {
            print("Error creating endpoint")
            return
        }
        
        let json: [String: Any] = ["message": message,"postId": postId]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        var request = URLRequest(url: endpoint)
        request.httpMethod = "POST"
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                
              self.dbData = []
            }
            }.resume()
        
        
    }
    
    func jsonParser() {
        
        
        guard let endpoint = URL(string: myUrl) else {
            print("Error creating endpoint")
            return
        }
        
        let request = URLRequest(url: endpoint)
        
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                
                let datastring = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print(datastring!)
                
                
                
                guard let data = data else {
                    throw JSONError.NoData
                }
                
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [NSDictionary] else {
                    
                    throw JSONError.ConversionFailed
                
                }
                print(json)
                self.dbData = json
                
            } catch let error as JSONError {
                print(error.rawValue)
            } catch let error as NSError {
                print(error.debugDescription)
            }
            }.resume()
    }
    
}
