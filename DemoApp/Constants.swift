import Foundation

struct Constants {
    
    struct UserDefaultKeys {
        static let hasSeenOnboarding = "has_seen_onboarding"
    }
    
    struct TableViewCellIdentifier {
        static let listCellView = "ListCellView"
    }
    
    struct CollectionViewCellIdentifier {
        static let CollectionCellView = "CollectionCellView"
    }
    
    struct ErrorMessages {
        static let notImplementedInitWithCoder = "init(coder:) has not been implemented"
        static let cellTypeNotRegistered = "cell type not registered"
        static let dataSourceSaveError = "Error saving to data source"
    }
    
    struct CoreData {
        static let persistentContainerName = "DemoAppDataModel" //should match xcdatamodel file name
    }
    
}
