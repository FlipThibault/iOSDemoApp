import XCTest
@testable import DemoApp

class OnboardingPresenterTests: XCTestCase {
    var presenter: OnboardingPresenter = OnboardingPresenter()
    var router = MockOnboardingRouterInput()
    var interactor = MockSetOnboardingStatusUseCase()
    
    override func setUp() {
        super.setUp()
        router = MockOnboardingRouterInput()
        interactor = MockSetOnboardingStatusUseCase()
        
        presenter.router = router
        presenter.interactor = interactor
    }
    
    func testConformsToProtocols() {
        if !self.presenter.conforms(to: OnboardingViewOutput.self) {
            XCTFail("Class does not conform to protocol : OnboardingViewOutput")
        }
    }
    
    func testInteractorCalledWhenDidClickNext() {
        presenter.didClickNext()
        XCTAssert(interactor.didCalledSetStatusForOnboarding)
    }
    
    func testStatusSetToTrue() {
        presenter.didClickNext()
        XCTAssert(interactor.status)
    }
    
    func testRouterCallsDismissWhenInteractorCompletes() {
        presenter.didClickNext()
        XCTAssert(router.didCallDismiss)
    }

    class MockOnboardingRouterInput: NSObject, OnboardingRouterInput {
        
        var didCallDismiss = false
        
        func requestDismiss() {
            didCallDismiss = true
        }
        
    }
    
    class MockSetOnboardingStatusUseCase: NSObject, SetOnboardingStatusUseCase {
        
        var didCalledSetStatusForOnboarding = false
        var status = false
        
        func setStatusForOnboarding(_ hasSeenOnboarding: Bool, _ completion: (Bool) -> Void) {
            didCalledSetStatusForOnboarding = true
            status = hasSeenOnboarding
            completion(true)
        }
    }
}
