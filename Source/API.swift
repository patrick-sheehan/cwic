//
//  API.swift
//  cwic
//
//  Created by Patrick Sheehan on 7/4/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import Foundation


class API {
  
//  enum EventFilterOptions {
//    case starred, trending, type
//  }
  
//  static func getEventsUriHelper(filter: EventFilterOptions? = nil) -> String {
//    if let filter = filter {
//      switch (filter) {
//      case .starred: return "events/starred/"
//      case .trending: return "events/trending/"
//      case .type:
//        if let type = type {
//          return "events/?type=\(type.code)"
//        }
//      }
//    }
//    return "events"
//  }
  
  
//    static let BaseURL = "http://127.0.0.1:8000"
//  static let BaseURL = "http://django-env.dpehantvcm.us-west-2.elasticbeanstalk.com"
  
//  static func get(uri: String, _ completion: @escaping (_ encodedData: Data) -> Void) {
//    let urlString = "http://127.0.0.1:8000/" + uri
//    guard let url = URL(string: urlString) else { return }
//    
//    
//    var urlRequest = URLRequest(url: url)
//    urlRequest.httpMethod = "GET"
//    
//    
//    // TODO: Use actual auth token
//    
//    let token = "5dafb5baad16bc628517f541c9bbd4c43309ffd5"
//    urlRequest.setValue("Token \(token)", forHTTPHeaderField: "Authorization")
//      
//    
//      
//    let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
////    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//      if error != nil { print(error!.localizedDescription) }
//      if let data = data {
//        completion(data)
//      }
//    }
//    task.resume()
//  }
  
//  static func getSponsors(_ completion: @escaping (_ results: [Sponsor]) -> Void) {
//    API.get(uri: "sponsors/") { data in
//      do {
//        let list = try JSONDecoder().decode(SponsorList.self, from: data)
//        completion(list.results)
//      } catch let jsonError {
//        print(jsonError)
//      }
//    }
//  }
  
//  static func getEvents(uri: String, _ completion: @escaping (_ results: [Event]) -> Void) {
//    API.get(uri: uri) { data in
//      do {
//        let list = try JSONDecoder().decode(EventList.self, from: data)
//        completion(list.results)
//      } catch let jsonError {
//        print(jsonError)
//      }
//    }
//  }
  
  

//  class func loginRequest(_ params: [String: Any],
//                          _ completion: @escaping () -> Void) {
//
//    // Clear old cookies
//    HTTPCookieStorage.shared.cookies?.forEach(HTTPCookieStorage.shared.deleteCookie)
//
//    let urlString = "\(API.BaseURL)/auth/login/"
//    guard let url = URL(string: urlString) else { PrinterService.error("Bad url: \(urlString)"); return }
//
//    // Build URL request
//    var urlRequest = URLRequest(url: url)
//    urlRequest.httpMethod = "POST"
//    urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
//
//    // Set json body
//    do {
//      urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
//    } catch {
//      PrinterService.error("Json serialization failed: \(error)")
//    }
//
//    let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//      if let error = error {
//        PrinterService.error("Request error: \(String(describing: error))"); return
//      }
//      guard let data = data else {
//        PrinterService.error("Error: did not receive data"); return
//      }
//
//      if let httpResponse = response as? HTTPURLResponse {
//        PrinterService.log("[\(httpResponse.statusCode)] ... \(url)")
//        if let headerFields = httpResponse.allHeaderFields as? [String: String] {
//          let cookies = HTTPCookie.cookies(withResponseHeaderFields: headerFields, for: response!.url!)
//          print(cookies)
//          cookies.forEach { cookie in
//            if cookie.name == "csrftoken" {
//              print(cookie.value)
//              AuthService.csrftoken = cookie.value
//            }
//          }
//        }
//      }
//
//      do {
//        guard let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
//          PrinterService.error("Deserialization error");
//          return
//        }
//
//        guard let key = result["key"] as? String else {
//          print("Failed to get auth key"); return
//        }
//        AuthService.authKey = key
//        completion()
//      } catch {
//        PrinterService.error("Deserialization error: \(error)")
//      }
//    }
//    task.resume()
//
//
//  }
//
//  class func request(_ method: String,
//                     _ urlString: String,
//                     _ params: [String: Any]?,
//                     _ completion: @escaping ([String: Any]) -> Void) {
//
//    // Build and verify URL type
//    guard let url = URL(string: urlString) else { PrinterService.error("Bad url: \(urlString)"); return }
//
//    // Build URL request
//    var urlRequest = URLRequest(url: url)
//    urlRequest.httpMethod = method
//    urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
//
//    // Set Auth Token
//    if let token = AuthService.authKey {
//      urlRequest.setValue("Token \(token)", forHTTPHeaderField: "Authorization")
//    }
//
//    // Set CSRF Token
//    if let csrftoken = AuthService.csrftoken {
//      urlRequest.setValue(csrftoken, forHTTPHeaderField: "X-CSRFToken")
//    }
//
//    // Set json body
//    if let params = params {
//      do {
//        urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
//      } catch {
//        PrinterService.error("Json serialization failed: \(error)")
//      }
//    }
//
//    let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//
//      if let error = error {
//        PrinterService.error("Request error: \(String(describing: error))"); return
//      }
//
//      guard let data = data else {
//        PrinterService.error("Error: did not receive data"); return
//      }
//
//      print(String(data: data, encoding: String.Encoding.utf8) ?? "Data could not be printed")
//
//      if let httpResponse = response as? HTTPURLResponse {
//        PrinterService.log("[\(httpResponse.statusCode)] ... \(url)")
//      }
//
//      do {
//        guard let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
//          PrinterService.error("Deserialization error");
//          return
//        }
//        completion(result)
//      } catch {
//        PrinterService.error("Deserialization error: \(error)")
//      }
//    }
//    task.resume()
//
//  }
  
}
