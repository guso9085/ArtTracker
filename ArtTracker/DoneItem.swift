//
//  DoneItem.swift
//  ArtTracker
//
//  Created by Gustav Solis on 4/4/20.
//  Copyright © 2020 Gustav Solis. All rights reserved.
//

import Foundation
import CoreData

public class DoneItem:NSManagedObject, Identifiable {
    @NSManaged public var title:String?
    @NSManaged public var client:String?
    @NSManaged public var finalRate:String?
    @NSManaged public var info:String?
    @NSManaged public var finishedAt:Date?
    @NSManaged public var hours:String?
    @NSManaged public var notes:String?
}

extension DoneItem {
    static func getAllDoneItems() -> NSFetchRequest<DoneItem> {
        let request:NSFetchRequest<DoneItem> = DoneItem.fetchRequest() as! NSFetchRequest<DoneItem>
        let sortDescriptor = NSSortDescriptor(key: "finishedAt", ascending:true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
