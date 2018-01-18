//
//  Api.swift
//  Conqube
//
//  Created by Patrick Sheehan on 10/15/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import Foundation
import UIKit

class ApiService {
  
  static var authDelegate: AuthDelegate? = nil
  
  static let BaseURL = "http://127.0.0.1:8001"
//  static let BaseURL = "http://cwic-env.2xzsvzeu7n.us-west-2.elasticbeanstalk.com"
  
  
  /// Used for Login or Register request, saves the auth key and CSRF token
  class func authRequest(urlString: String,
                         params: [String: Any],
                         _ completion: @escaping () -> Void) {
    
    clearCookies()
    
    guard let (req, reqDescription) = buildUrlRequest(urlString, method: "POST", params: params, authRequired: false) else {
      PrinterService.error("Failed to build url request"); return
    }
    
    let task = URLSession.shared.dataTask(with: req) { (data, response, error) in
      
      if let error = error {
        PrinterService.error("Request error: \(error.localizedDescription). \(reqDescription)"); return
      }
      
      guard let data = data else {
        PrinterService.error("Failed to receive data: \(reqDescription)"); return
      }
      
      parseResponse(response, reqDescription: reqDescription, authRequired: false, readCookies: true)
      
      do {
        guard let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
          PrinterService.error("Deserialization error: \(reqDescription)"); return
        }
        
        guard let key = result["key"] as? String else {
          PrinterService.error("Failed to get auth key"); return
        }
        AuthService.authKey = key
        completion()
      } catch {
        PrinterService.error("Deserialization error: \(error). \(reqDescription)")
      }
    }
    task.resume()
  }
  
  class func request(_ method: String,
                     _ urlString: String,
                     _ params: [String: Any]?,
                     _ completion: @escaping ([String: Any]) -> Void) {
    
    guard let (req, reqDescription) = buildUrlRequest(urlString, method: method, params: params, authRequired: true) else {
      PrinterService.error("Failed to build url request"); return
    }
    
    let task = URLSession.shared.dataTask(with: req) { (data, response, error) in
      
      if let error = error {
        PrinterService.error("Request error: \(error.localizedDescription). \(reqDescription)"); return
      }
      
      guard let data = data else {
        PrinterService.error("Failed to receive data: \(reqDescription)"); return
      }
      
      parseResponse(response, reqDescription: reqDescription, authRequired: true)
      
      do {
        guard let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
          PrinterService.error("Deserialization error: \(reqDescription)"); return
        }
        completion(result)
      } catch {
        if method == "DELETE" {
          completion([:])
        } else {
          PrinterService.error("Deserialization error: \(error). \(reqDescription)")
        }
      }
    }
    task.resume()
  }
  
  class func uploadImage(urlString: String,
                         image: UIImage,
                         _ completion: @escaping () -> Void) {
    
    let imageData = UIImageJPEGRepresentation(image, 1.0)!
    
    let _ = SRWebClient.POST(urlString)
      .data(imageData, fieldName: "image", data: nil)
      .send({ (response, status) in
        PrinterService.log("[\(status)] ... POST :: \(urlString)")
        completion()
      }, failure: { error in
        PrinterService.error("Upload error: \(error)")
      })
  }
  
  
  // MARK: - Helper Methods
  
  class func clearCookies() {
    HTTPCookieStorage.shared.cookies?.forEach(HTTPCookieStorage.shared.deleteCookie)
  }
  
  fileprivate class func parseResponse(_ response: URLResponse?,
                                       reqDescription: String,
                                       authRequired: Bool,
                                       readCookies: Bool = false) {
    
    if let httpResponse = response as? HTTPURLResponse {
      PrinterService.log("[\(httpResponse.statusCode)] ... \(reqDescription)")
      
      // Request requiring authentication
      if authRequired && httpResponse.statusCode == 401 {
        PrinterService.error("Received 401 error code: \(reqDescription)")
        self.authDelegate?.goToLogin()
        return
      }
      
      // Authentication Methods
      if readCookies {
        if let headerFields = httpResponse.allHeaderFields as? [String: String] {
          let cookies = HTTPCookie.cookies(withResponseHeaderFields: headerFields, for: response!.url!)
          cookies.forEach { cookie in
            if cookie.name == "csrftoken" {
              AuthService.csrftoken = cookie.value
            }
          }
        }
      }
    }
  }
  
  
  fileprivate class func buildUrlRequest(_ urlString: String,
                                         method: String,
                                         params: [String: Any]? = nil,
                                         authRequired: Bool) -> (req: URLRequest, reqDescription: String)? {
    
    let reqDescription = "\(method) :: \(urlString)"
    
    // URL
    guard let url = URL(string: urlString) else {
      PrinterService.error("Invalid url: \(reqDescription)");
      return nil
    }
    
    // Request
    var req = URLRequest(url: url)
    req.httpMethod = method
    req.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
    
    // Authentication
    if authRequired {
      guard let authToken = AuthService.authKey,
        let csrftoken = AuthService.csrftoken else {
          PrinterService.error("Failed to get auth credentials: \(reqDescription)");
          self.authDelegate?.goToLogin()
          return nil
      }
      req.setValue("Token \(authToken)", forHTTPHeaderField: "Authorization")
      req.setValue(csrftoken, forHTTPHeaderField: "X-CSRFToken")
    }
    
    // Parameters
    if let params = params {
      do {
        req.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
      } catch {
        PrinterService.error("Json parameter serialization failed: \(error). \(reqDescription)");
        return nil
      }
    }
    return (req, reqDescription)
  }
}
