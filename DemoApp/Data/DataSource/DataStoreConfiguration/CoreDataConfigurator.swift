import Foundation
import UIKit
import CoreData

class CoreDataConfigurator: NSObject, DataStoreConfigurator {
    
    var managedObjectContext: NSManagedObjectContext?
    var persistentContainer: NSPersistentContainer?
    
    func initDataStore(_ completion: @escaping () -> Void) {
        
        persistentContainer = NSPersistentContainer(name: Constants.CoreData.persistentContainerName)
        persistentContainer?.loadPersistentStores() { (description, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
            DispatchQueue.main.async {
                completion()
            }
        }
        
    }
    
}
