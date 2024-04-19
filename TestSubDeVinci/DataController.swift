//
//  DataController.swift
//  TestSubDeVinci
//
//  Created by Bruno Gomes Peixoto on 19/04/2024.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    static var shared = DataController()
    
    let container = NSPersistentContainer(name: "Users")
    var viewContext: NSManagedObjectContext{
        return container.viewContext
    }
    
    private init(){
        container.loadPersistentStores{
            _, error in
            
            if let error = error{
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    func getUsers() -> [User]{
        let request = NSFetchRequest<User>(entityName: "User")
        
        do{
            return try viewContext.fetch(request)
        } catch{
            return []
        }
    }
    
    func getUser(nickname: String) -> User?{
        let request = NSFetchRequest<User>(entityName: "User")
        request.predicate = NSPredicate(format: "nickname == %@", nickname)
        request.fetchLimit = 1
        
        do{
            return try viewContext.fetch(request).first
        } catch{
            return nil
        }
    }
    
    func getGrade(of nickname: String) -> String?{
        if let user = getUser(nickname: nickname){
            if user.grade != nil{
                return user.grade
            }
        }
        
        return nil
    }
}
