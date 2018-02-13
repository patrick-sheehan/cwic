//
//  ProfileViewController.swift
//  Conqube
//
//  Created by Patrick Sheehan on 7/13/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
  
  // MARK: - Member Variables
  let imagePicker = UIImagePickerController()
  var user: User? = nil
  var delegate: AuthDelegate? = nil
  
  class var listSegments: [UITableViewController] {
    return [
      TrophyListViewController(),
      EventListViewController()
    ]
  }
  
  
  // MARK: - IB Outlets
  @IBOutlet weak var usernameLabel: UILabel!
  @IBOutlet weak var userTypeLabel: UILabel!
  @IBOutlet weak var avatarImageView: UIImageView!
  @IBOutlet var didTapAvatarGesture: UITapGestureRecognizer!
  
  
  
  //  lazy var actions: [Action] = {
  //    return [
  //      Action("Edit Profile", viewController: self),
  //      Action("My Tickets", viewController: self),
  //      Action("My Pages", viewController: self),
  //      Action("Send Push Notification", viewController: self),
  //      Action("Become a Judge", viewController: self)
  //    ]
  //  }()

  
  
  class func generate(delegate: AuthDelegate) -> ProfileViewController {
    let vc = UIViewController.create("ProfileViewController") as! ProfileViewController
    vc.delegate = delegate
    return vc
  }
  
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Profile"
    
    imagePicker.delegate = self
    usernameLabel.textColor = Cwic.Blue
    userTypeLabel.textColor = Cwic.Blue
    
    didTapAvatarGesture.addTarget(self, action: #selector(didTapAvatar))
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      title: "Edit", style: .plain, target: self, action: #selector(viewEdit))
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(
      title: "Logout", style: .plain, target: self, action: #selector(logout))
  }
  
  @objc func logout() {
    present(
      UIAlertController(title: "Are you sure you want to logout?", message: nil, preferredStyle: .alert)
        .withAction(UIAlertAction(title: "Yes, log me out", style: .destructive, handler: { _ in
          self.delegate?.goToLogin()
        }))
        .withCancelAction(),
      animated: true,
      completion: nil)
  }
  
  @objc func viewEdit() {
    guard let user = self.user else {
      PrinterService.error("Missing User"); return
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
      avatarImageView.downloadedFrom(link: user.profile.avatar, contentMode: .scaleAspectFill)
      avatarImageView.round(corners: .allCorners, radius: avatarImageView.frame.width / 2)
    }
  }
  
  // MARK: - Networking
  @objc func refreshData() {
    UserService.getMyProfile { user in
      DispatchQueue.main.async {
        self.user = user
        self.viewWillLayoutSubviews()
        
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
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  func imagePickerController(_ picker: UIImagePickerController,
                             didFinishPickingMediaWithInfo info: [String : Any]) {
    if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
      ApiService.uploadImage(urlString: UserService.AVATAR_URL, image: pickedImage, self.refreshData)
    }
    
    dismiss(animated: true, completion: nil)
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true, completion: nil)
  }
}
