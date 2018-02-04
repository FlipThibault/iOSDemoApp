import Foundation

class DetailPresenter : NSObject {
    
    let id: String
    weak var view : DetailViewInput?
    var router: DetailRouterInput?
    
    init(with id: String) {
        self.id = id
    }
    
}

extension DetailPresenter : DetailViewOutput {
    
}
