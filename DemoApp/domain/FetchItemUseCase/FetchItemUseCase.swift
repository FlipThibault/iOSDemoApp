import Foundation

protocol FetchItemUseCase {
    func fetchItem(by identifier: String/*, with completion: SomeCompletion*/)
}
