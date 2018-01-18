//
//  ProfileFormViewController.swift
//  CWIC
//
//  Created by Patrick Sheehan on 1/14/18.
//  Copyright © 2018 Síocháin Solutions. All rights reserved.
//


import Eureka

class ProfileFormViewController: FormViewController {
  
  // MARK: - Member Variables
  var profileParams = [String: Any]()
  var params = [String: Any]()
  var user: User? = nil
  var authDelegate: AuthDelegate? = nil
  
  // MARK: - Actions
  func update() {
    if let genderString = profileParams["gender"] as? String {
      profileParams["gender"] = Genders[genderString]
    }
    
    params["profile"] = profileParams
    
    UserService.patchProfile(params) {
      DispatchQueue.main.async {
        PrinterService.log("Finished patching profile. Dismissing ProfileForm")
        self.dismiss()
      }
    }
  }
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "Update Profile"
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    guard let user = self.user else {
      PrinterService.error("Missing User for Profile Form view")
      return
    }
    buildForm(user)
  }
  
  func buildForm(_ user: User) {
    
    let userSection = Section()
      <<< TextRow() {
        $0.title = "First name"
        $0.value = user.first_name
        $0.onChange { [unowned self] row in
          if let value = row.value {
            self.params["first_name"] = value
          }
        }
    }
      <<< TextRow() {
        $0.title = "Last name"
        $0.value = user.last_name
        $0.onChange { [unowned self] row in
          if let value = row.value {
            self.params["last_name"] = value
          }
        }
    }
    
      let profileSection = Section()
      <<< TextRow() {
        $0.title = "Hometown"
        $0.value = user.profile.hometown
        $0.onChange { [unowned self] row in
          if let value = row.value {
            self.profileParams["hometown"] = value
          }
        }
    }
    
      <<< PushRow<String>() {
        $0.title = "Gender"
        $0.value = user.profile.gender
        $0.options = genderOptions
        $0.onChange { [unowned self] row in
          if let value = row.value {
            self.profileParams["gender"] = value
          }
        }
    }
    
      <<< DateRow() {
        $0.title = "Birthdate"
        $0.value = formatter.date(from: user.profile.birthdate)
        $0.onChange { [unowned self] row in
          if let value = row.value {
            self.profileParams["birthdate"] = self.formatter.string(from: value)
          }
        }
    }
    
      <<< PhoneRow() {
        $0.title = "Phone Number"
        $0.value = user.profile.phone_number
        $0.onChange { [unowned self] row in
          if let value = row.value {
            self.profileParams["phone_number"] = value
          }
        }
    }
    
      <<< IntRow() {
        $0.title = "Years attended"
        $0.value = user.profile.years_attended
        $0.onChange { [unowned self] row in
          if let value = row.value {
            self.profileParams["years_attended"] = value
          }
        }
    }
    
      <<< TextAreaRow() {
        $0.placeholder = "How did you hear about us?"
        $0.value = user.profile.how_discovered
        $0.onChange { [unowned self] row in
          if let value = row.value {
            self.profileParams["how_discovered"] = value
          }
        }
    }

    let buttonSection = Section()
      <<< ButtonRow() {
        $0.title = "Update"
        $0.onCellSelection { _, _ in
          self.update()
        }
      }

    
    form.removeAll()
    form += [userSection, profileSection, buttonSection]
  }
  
  
  
  // MARK: - Lazy Variables

  lazy var genderOptions: [String] = {
    return Genders.map{(key, _) -> String in
      return key
    }
  }()
  
  lazy var formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter
  }()
}


//  var username: String = ""
//  var first_name: String = ""
//  var last_name: String = ""
//  var hometown: String = ""
//  var years_attended: Int = 0
//  var how_discovered: String = ""
//  var gender: String = ""
//  var birthdate: Date? = nil
//  var phone_number: String = ""
