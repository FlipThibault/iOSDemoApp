import Foundation

//fake data in database

let fakeList: AppListModel = {
    
    let lowerBounds = 1
    let upperBounds = 2
    
    let testList = AppListModel(with: "TestList")
    
    for index in lowerBounds...upperBounds {
        let item = AppListItemModel()
        item.descriptionText = String(index)
//        testList.items.append(item)
    }
    
    return testList
}()
