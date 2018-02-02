import Foundation

class DetailPresenter : NSObject {
    
    let id: String
    weak var view : DetailViewInput?
    let router: DetailRouterInput
    
    init(with id: String, with router : DetailRouterInput) {
        self.id = id
        self.router = router
    }
    
}

extension DetailPresenter : DetailViewOutput {
    
}
