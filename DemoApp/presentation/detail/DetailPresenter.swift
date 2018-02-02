import Foundation

class DetailPresenter : NSObject {
    
    weak var view : DetailViewInput?
    var router: DetailRouterInput
    
    init(with router : DetailRouterInput) {
        self.router = router
    }
    
}

extension DetailPresenter : DetailViewOutput {
    
}
