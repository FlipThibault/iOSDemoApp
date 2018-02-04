import Foundation

let fakeList: AppListModel = {
    
    let testList = AppListModel(with: "TestList")
    
    for index in 0...15 {
        let item = AppListItemModel(with: testList)
        item.description = String(index)
        testList.items.append(item)
    }
    
    return testList
}()
