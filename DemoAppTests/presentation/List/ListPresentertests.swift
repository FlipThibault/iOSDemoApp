import XCTest
@testable import DemoApp

class ListPresentertests: XCTestCase {
    
    var presenter = ListPresenter()
    var deleteItemUseCase = MockDeleteItemInteractor()
    var saveItemUseCase = MockSaveItemInteractor()
    var fetchListUseCase = MockFetchListUseCase()
    var view = MockListView()
    var router = MockListRouter()
    
    override func setUp() {
        super.setUp()
        
        presenter.view = view
        presenter.saveItemUseCase = saveItemUseCase
        presenter.deleteItemUseCase = deleteItemUseCase
        presenter.fetchListUseCase = fetchListUseCase
        presenter.router = router
    }
    
    func testConformsToProtocolListVewOutput() {
        if !self.presenter.conforms(to: ListViewOutput.self) {
            XCTFail("Class does not conform to protocol : ListVewOutput")
        }
    }
    
    func testConformsToProtocolListViewDataProvider() {
        if !self.presenter.conforms(to: ListViewDataProvider.self) {
            XCTFail("Class does not conform to protocol : ListViewDataProvider")
        }
    }
    
    func testConformsToProtocolListViewInteractionHandler() {
        if !self.presenter.conforms(to: ListViewInteractionHandler.self) {
            XCTFail("Class does not conform to protocol : ListViewInteractionHandler")
        }
    }
    
    func testConformsToProtocolDetailViewModuleDelegate() {
        if !self.presenter.conforms(to: DetailViewModuleDelegate.self) {
            XCTFail("Class does not conform to protocol : DetailViewModuleDelegate")
        }
    }
    
    func testConformsToProtocolAddItemViewModuleDelegate() {
        if !self.presenter.conforms(to: AddItemViewModuleDelegate.self) {
            XCTFail("Class does not conform to protocol : AddItemViewModuleDelegate")
        }
    }
    
    func testIsLoadedFetchesList() {
        presenter.isLoaded()
        XCTAssert(fetchListUseCase.fetchListWasCalled)
    }
    
    func testEmptyViewShownWhenListModelEmpty() {
        presenter.isLoaded()
        XCTAssert(view.showEmptyViewCalled)
        XCTAssert(!view.populateViewWithDataCalled)
    }
    
    func testPopulateViewWithDataCalledWhenListModelEmpty() {
        fetchListUseCase.mockListModel.items = [AppListItemModel()]
        presenter.isLoaded()
        XCTAssert(!view.showEmptyViewCalled)
        XCTAssert(view.populateViewWithDataCalled)
    }
    
    func testPresenterModelUpdatedWhenIsLoadedCalled() {
        fetchListUseCase.mockListModel.items = [AppListItemModel()]
         XCTAssert(presenter.listModel == nil)
        presenter.isLoaded()
        XCTAssert(presenter.listModel == fetchListUseCase.mockListModel)
    }
    
    func testPresenterListViewModelUpdatedWhenIsLoadedCalled() {
        fetchListUseCase.mockListModel.items = [AppListItemModel()]
        XCTAssert(presenter.listViewModel == nil)
        presenter.isLoaded()
        
        if let viewModel = presenter.listViewModel {
            XCTAssert(viewModel.getDisplayItems().count == 1)
            XCTAssert(viewModel.getDisplayName() == fetchListUseCase.mockListModel.name)
        } else {
            XCTFail()
        }
    }
    
    func testGoToAddViewCalledWhenAddItemRequested() {
        presenter.isLoaded()
        presenter.addItemRequested()
        XCTAssert(router.goToAddViewCalled)
    }
    
    func testPresenterIsEditingTogglesWhenToggleEditMode() {
        presenter.isEditing = false
        presenter.toggleEditMode()
        XCTAssert(presenter.isEditing)
        presenter.toggleEditMode()
        XCTAssert(!presenter.isEditing)
    }
    
    func testViewSetEditModeCalledWhenToggleEditMode() {
        presenter.toggleEditMode()
        XCTAssert(view.setEditModeCalled)
    }
    
    func testValidViewModelReturnedWhenGetDataCalled() {
        fetchListUseCase.mockListModel.items = [AppListItemModel()]
        XCTAssert(presenter.listViewModel == nil)
        presenter.isLoaded()
        
        if let viewModel = presenter.listViewModel, let testViewModel = presenter.getData() {
            XCTAssert(viewModel.getDisplayItems().count == testViewModel.getDisplayItems().count)
            XCTAssert(viewModel.getDisplayName() == testViewModel.getDisplayName())
        } else {
            XCTFail()
        }
    }
    
    func testOnItemClickCallsRouterGoToDetail() {
        fetchListUseCase.mockListModel.items = [AppListItemModel()]
        presenter.isLoaded()
        presenter.onItemClick(at: IndexPath(row: 0, section: 0))
        XCTAssert(router.goToDetailCalled)
    }
    
    class MockDeleteItemInteractor: NSObject, DeleteItemUseCase {
        
        func deleteItem(item: AppListItemModel, from list: AppListModel, with completion: @escaping (AppListItemModel, NSError?) -> Void) {
            
        }
        
    }
    
    class MockSaveItemInteractor: NSObject, SaveItemUseCase {
        
        func saveItem(with description: String, to list: AppListModel, with completion: @escaping (AppListItemModel, NSError?) -> Void) {
            
        }
        
        func saveItem(item: AppListItemModel, to list: AppListModel, with completion: @escaping (AppListItemModel, NSError?) -> Void) {
            
        }
        
    }
    
    class MockListView: NSObject, ListViewInput {
        
        var showEmptyViewCalled = false
        var populateViewWithDataCalled = false
        var hideEmptyViewCalled = false
        var setEditModeCalled = false
        
        func populateViewWithData() {
            populateViewWithDataCalled = true
        }
        
        func setEditMode(isEditing: Bool) {
            setEditModeCalled = true
        }
        
        func showError(listViewErrorViewModel: ErrorViewModel) {
            
        }
        
        func showEmptyView() {
            showEmptyViewCalled = true
        }
        
        func hideEmptyView() {
            hideEmptyViewCalled = true
        }
        
        func notifyItemUpdated(at indexPath: IndexPath) {
            
        }
        
        func notifyItemAdded(at indexPath: IndexPath) {
            
        }
        
        func notifyItemRemoved(at indexPath: IndexPath) {
            
        }
        
    }
    
    class MockFetchListUseCase: NSObject, FetchListUseCase {
        
        var fetchListWasCalled = false
        var mockListModel = AppListModel(with: "test")

        func fetchList(by id: String, with completion: @escaping (AppListModel, NSError?) -> Void) {
            fetchListWasCalled = true
            
            completion(mockListModel, nil)
        }
        
    }
    
    class MockListRouter: NSObject, ListRouterInput {
        
        var goToDetailCalled = false
        var goToAddViewCalled = false

        func goToDetail(with delegate: DetailViewModuleDelegate, and item: AppListItemModel, and list: AppListModel) {
            goToDetailCalled = true
        }
        
        func goToAddView(with delegate: AddItemViewModuleDelegate, and list: AppListModel) {
            goToAddViewCalled = true
        }
        
    }
    
    
}
