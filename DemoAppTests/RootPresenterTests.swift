import XCTest
@testable import DemoApp

class RootPresenterTests: XCTestCase {
    var presenter: RootPresenter = RootPresenter()
    var router: MockRootRouter = MockRootRouter()
    var interactor: MockShouldShowOnboardingInteractor = MockShouldShowOnboardingInteractor()

    override func setUp() {
        super.setUp()
        router = MockRootRouter()
        interactor = MockShouldShowOnboardingInteractor()

        presenter.router = router
        presenter.interactor = interactor
    }
    override func tearDown() {
        super.tearDown()
    }
    func testConformsToProtocols() {
        if !self.presenter.conforms(to: RootViewOutput.self) {
            XCTFail("Class does not conform to protocol : RootViewOutput")
        }
    }
    func testInteractorGetsCalledOnViewDidLoad() {
        presenter.viewDidLoad()
        XCTAssert(interactor.shouldShowOnboardingWasCalled)
    }
    func testProperRouterFunctionCalledWhenInteractorTrue() {
        interactor.forceReturnShouldShowOnboardingValue = true
        presenter.viewDidLoad()
        XCTAssert(!router.goToOnboardingWasCalled)
        XCTAssert(router.goToNextWasCalled)
    }
    func testProperRouterFunctionCalledWhenInteractorFalse() {
        interactor.forceReturnShouldShowOnboardingValue = false
        presenter.viewDidLoad()
        XCTAssert(router.goToOnboardingWasCalled)
        XCTAssert(!router.goToNextWasCalled)
    }
    class MockRootRouter: NSObject, RootRouterInput {
        var goToNextWasCalled = false
        var goToOnboardingWasCalled = false
        func goToNext() {
            goToNextWasCalled = true
        }
        func goToOnboarding() {
            goToOnboardingWasCalled = true
        }
    }
    class MockShouldShowOnboardingInteractor: NSObject, FetchOnboardingStatusUseCase {
        var shouldShowOnboardingWasCalled = false
        var forceReturnShouldShowOnboardingValue = false
        func shouldShowOnboarding(_ completion: (Bool) -> Void) {
            shouldShowOnboardingWasCalled = true
            completion(forceReturnShouldShowOnboardingValue)
        }
    }
}
