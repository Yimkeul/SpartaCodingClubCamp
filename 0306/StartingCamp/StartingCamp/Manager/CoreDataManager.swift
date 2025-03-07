//
//  CoreDataManager.swift
//  StartingCamp
//
//  Created by yimkeul on 3/6/25.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {

    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    // 모든 Memo 가져오기
    func fetchAllMemos(completion: @escaping ([Memo]) -> Void) {
        let fetchRequest: NSFetchRequest<Memo> = Memo.fetchRequest()

        do {
            let memos = try context.fetch(fetchRequest)
            completion(memos)
        } catch {
            print("Failed to fetch memos: \(error)")
            completion([])
        }
    }

    // 새로운 Memo 추가
    func addNewMemo(title: String, description: String, imageName: String) {
        let newMemo = Memo(context: context)
        newMemo.title = title
        newMemo.desc = description
        newMemo.imageName = imageName
        newMemo.date = Date()
        newMemo.uuid = UUID()

        saveContext()
    }

    // Context 저장
    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}
