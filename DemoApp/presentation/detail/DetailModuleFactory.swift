import Foundation

class DetailModuleFactory {
    
    static func buildModule() -> DetailViewController {
        
        let view = DetailView()
        let router = DetailRouter()
        let presenter = DetailPresenter(with: router)
        
        let vc = DetailViewController(with: view)

        presenter.router = router
        
        return vc
        
    }
    
}


