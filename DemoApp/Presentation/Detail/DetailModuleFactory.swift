import Foundation

class DetailModuleFactory {
    
    static func buildModule(with id: String) -> DetailViewController {
        
        let view = DetailView()
        let router = DetailRouter()
            
        let presenter = DetailPresenter(with: id)
        
        let vc = DetailViewController(with: view)

        presenter.router = router
        vc.presenter = presenter
        
        return vc
        
    }
    
}


