//
//  ToDoItem.swift
//  ArtTracker
//
//  Created by Gustav Solis on 2/29/20.
//  Copyright © 2020 Gustav Solis. All rights reserved.
//

import Foundation
import CoreData

public class ToDoItem:NSManagedObject, Identifiable {
    @NSManaged public var title:String?
    @NSManaged public var client:String?
    @NSManaged public var rate:String?
    @NSManaged public var info:String?
    @NSManaged public var createdAt:Date?
}

extension ToDoItem {
    static func getAllToDoItems() -> NSFetchRequest<ToDoItem> {
        let request:NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest() as! NSFetchRequest<ToDoItem>
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending:true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
