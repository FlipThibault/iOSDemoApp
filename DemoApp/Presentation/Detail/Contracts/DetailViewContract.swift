import Foundation

protocol DetailViewInput : NSObjectProtocol {
    
    func displayData(itemViewModel: DetailViewModel)
    
}

protocol DetailViewOutput : NSObjectProtocol {
    
    func isLoaded()

}
