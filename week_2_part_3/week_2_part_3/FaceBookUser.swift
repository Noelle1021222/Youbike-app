//
//  FaceBookUser.swift
//  week_2_part_3
//
//  Created by 許雅筑 on 2016/9/8.
//  Copyright © 2016年 許雅筑. All rights reserved.
//

import Foundation


//  調整中


//class FaceBookUser{
//    let name:String
//    let pictureImage: UIImage?
//    
//    convenience init?(json: AnyObject){
//        guard let dictionary = json as? NSDictionary
//            else {return nil}
//        
//        self.init(dictionary:dictionary)
//    }
//    
//    
//    init?(dictionary: NSDictionary)
//    {
//        guard let name = dictionary["name"] as? String
//            else{return nil}
//        
//        self.name = name
//        
//        guard let picture = dictionary["picture"] as? NSDictionary,
//        let picData = picture["data"] as? NSDictionary,
//        let modifiedUrlStr = picData["url"] as? String,
//        let url = NSURL(string: modifiedUrlStr),
//        let data = NSData(contentsOfURL: url)
//            else{
//                return nil
//                
//        }
//        profilePicture.image = UIImage(data:data)
//
//    }
//}