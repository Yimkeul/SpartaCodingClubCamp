//
//  Memo+CoreDataProperties.swift
//  StartingCamp
//
//  Created by yimkeul on 3/6/25.
//
//

import Foundation
import CoreData


extension Memo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Memo> {
        return NSFetchRequest<Memo>(entityName: "Memo")
    }

    @NSManaged public var title: String?
    @NSManaged public var desc: String?
    @NSManaged public var imageName: String?
    @NSManaged public var uuid: UUID?
    @NSManaged public var date: Date?

}

extension Memo : Identifiable {

}
