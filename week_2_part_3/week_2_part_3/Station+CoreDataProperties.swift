//
//  Station+CoreDataProperties.swift
//  week_2_part_3
//
//  Created by 許雅筑 on 2016/9/15.
//  Copyright © 2016年 許雅筑. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Station {

    @NSManaged var ar: String?
    @NSManaged var aren: String?
    @NSManaged var lat: String?
    @NSManaged var lng: String?
    @NSManaged var sarea: String?
    @NSManaged var sbi: String?
    @NSManaged var sna: String?
    @NSManaged var id: String?

}
