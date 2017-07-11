//
//  LogInFacebookViewController.swift
//  week_2_part_3
//
//  Created by 許雅筑 on 2016/9/6.
//  Copyright © 2016年 許雅筑. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FacebookCore
import FacebookLogin
//import LoadFacebookProfileKit

class LogInFacebookViewController: UIViewController {
    
    //供外部存取
    var userName: String = ""
    var userEmail: String = ""
    var userLink: String = ""
    var userID: String = ""
    var userPictureURL: String = ""
    var userDefault = UserDefaults.standard



    @IBOutlet weak var logInView: UIView!
    @IBOutlet weak var logButton: UIButton!
    @IBOutlet weak var bikeImage: UIImageView!
    
    
    var userProfile: String = ""
    
    override func viewDidLoad() {
        //登入的NSLocalizedString

        logButton.setTitle(NSLocalizedString("login", comment: "Title for sound on"), for: UIControlState())
        print(NSLocalizedString("test",comment:"defalue"))
        super.viewDidLoad()
        //background
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "pattern-wood")!)
        
        bikeImage.layer.borderWidth = 1
        bikeImage.layer.masksToBounds = false
        bikeImage.layer.borderColor = UIColor(red: 61/255, green: 52/255, blue: 66/255, alpha: 1).cgColor
        bikeImage.layer.cornerRadius = bikeImage.frame.height/2
        bikeImage.layer.backgroundColor = UIColor(red: 254/255, green: 241/255, blue: 220/255, alpha: 1).cgColor
        bikeImage.clipsToBounds = true
        
        //圓角
        logInView.layer.cornerRadius = 10
        
        
        logButton.addTarget(self, action: #selector(self.loginButtonClicked), for: .touchUpInside)
        //part4
        

    }
    
    //點擊login
    func loginButtonClicked() {
        let loginManager = LoginManager()
        loginManager.logIn([ .publicProfile,.email ], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, _, _):
                if grantedPermissions.contains("email")
                {
                    self.returnUserData()
                }
                
                print("Logged in!")
                let protectedPage = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController

                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = protectedPage
                //LogInFacebookViewController 會被記憶體釋放
                
                
            }
        }
    }
    //retrieve
    func returnUserData()
    {
        var dict : NSDictionary!

        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, email,link,picture.width(150).height(150)"])
        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            if ((error) != nil)
            {

                print("Error: \(error)")
            }
            else
            {
                var myImageURL:String = ""
                print("fetched user: \(result)")
                dict = result as! NSDictionary
                self.userDefault.set(result.value(forKey: "name"),forKey: "userName")
                
                self.userDefault.set(result.value(forKey: "link"),forKey: "userLink")

                self.userDefault.set(result.value(forKey: "email"),forKey: "userEmail")

                if let imageURL = ((dict.value(forKey: "picture") as AnyObject).value(forKey: "data") as AnyObject).value(forKey: "url") as? String {
                    myImageURL = imageURL
                }
                //已解析
                self.userDefault.set(myImageURL,forKey: "userPictureURL")
                
//                self.userDefault.synchronize()
                self.userName = self.userDefault.object(forKey: "userName") as! String
                self.userPictureURL = self.userDefault.object(forKey: "userPictureURL") as! String
                self.userLink = self.userDefault.object(forKey: "userLink") as! String
                self.userEmail = self.userDefault.object(forKey: "userEmail") as! String
                self.userPictureURL = self.userDefault.object(forKey: "userPictureURL") as! String

                print("name:\(self.userName)")
                print("picture url:\(self.userPictureURL)")
                print("user link:\(self.userLink)")
                print("user mail: \(self.userEmail)")

            }
        })
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
