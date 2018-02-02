import Foundation

class DetailModuleFactory {
    
    static func buildModule(with id: String) -> DetailViewController {
        
        let view = DetailView()
        let router = DetailRouter()
    
//        let fetchItemInteractor : FetchItemUseCase = FetchItemInteractor()
        
        let presenter = DetailPresenter(with: router)
        
        let vc = DetailViewController(with: view)

        presenter.router = router
        
        return vc
        
    }
    
}


