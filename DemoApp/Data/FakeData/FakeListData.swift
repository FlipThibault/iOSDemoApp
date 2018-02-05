import Foundation

//fake data in database

let fakeList: AppListModel = {
    
    let testList = AppListModel(with: "TestList")
    
    for index in 1...15 {
        let item = AppListItemModel()
        item.description = String(index)
        testList.items.append(item)
    }
    
    return testList
}()
