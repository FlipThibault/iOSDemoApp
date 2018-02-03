import Foundation

protocol DeleteItemUseCase {
    func deleteItem(by identifier: String/*, with completion: SomeCompletion*/)
}
