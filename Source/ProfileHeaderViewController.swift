//
//  ProfileHeaderViewController.swift
//  Conqube
//
//  Created by Patrick Sheehan on 7/13/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import UIKit

class ProfileHeaderViewController: UIViewController {
  
  // MARK: - Member Variables
  let imagePicker = UIImagePickerController()
  var user: User? = nil
  var delegate: AuthDelegate? = nil
  
  // MARK: - IB Outlets
  @IBOutlet weak var usernameLabel: UILabel!
  @IBOutlet weak var userTypeLabel: UILabel!
  @IBOutlet weak var avatarImageView: UIImageView!
  @IBOutlet var didTapAvatarGesture: UITapGestureRecognizer!
  
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Profile"
    
    imagePicker.delegate = self
    usernameLabel.textColor = Cwic.Blue
    userTypeLabel.textColor = Cwic.Blue
    
    didTapAvatarGesture.addTarget(self, action: #selector(didTapAvatar))
    
//    self.navigationItem.rightBarButtonItem = UIBarButtonItem(
//      title: "Edit", style: .plain, target: self,
//      action: #selector(viewEdit))
//    
//    self.navigationItem.leftBarButtonItem = UIBarButtonItem(
//          title: "Logout", style: .plain, target: delegate!,
//          action: #selector(AuthDelegate.goToLogin))
  }
  
  @objc func viewEdit() {
    guard let user = self.user else {
      print("No User"); return
    }
    let vc = ProfileFormViewController()
    vc.user = user
    navigationController?.pushViewController(vc, animated: true)
    AuthService.shouldPromptProfileUpdate = false
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    refreshData()
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
    if let user = self.user {
      usernameLabel.text = user.username
      userTypeLabel.text = user.profile.user_type
      avatarImageView.downloadedFrom(link: user.profile.avatar)
      avatarImageView.round(corners: .allCorners, radius: avatarImageView.frame.width / 2)
    }
  }
  
  // MARK: - Networking
  @objc func refreshData() {
    UserService.getMyProfile { user in
      DispatchQueue.main.async {
        self.user = user
        self.viewWillLayoutSubviews()
        PrinterService.log("ProfileHeader refreshed data. Try to show the profile form")
        
        if AuthService.shouldPromptProfileUpdate {
          self.viewEdit()
        }
      }
    }
  }
  
  // MARK: - Actions
  @objc func didTapAvatar() {
    imagePicker.allowsEditing = false
    imagePicker.sourceType = .photoLibrary
    present(imagePicker, animated: true, completion: nil)
  }
}


// MARK: - Image Picker Methods
extension ProfileHeaderViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  func imagePickerController(_ picker: UIImagePickerController,
                             didFinishPickingMediaWithInfo info: [String : Any]) {
    if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
      
      let urlString = "\(ApiService.BaseURL)/users/avatar/"
      ApiService.uploadImage(urlString: urlString, image: pickedImage) {
        DispatchQueue.main.async {
          self.avatarImageView.contentMode = .scaleAspectFill
          self.avatarImageView.image = pickedImage
        }
      }
    }
    
    dismiss(animated: true, completion: nil)
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true, completion: nil)
  }
}
