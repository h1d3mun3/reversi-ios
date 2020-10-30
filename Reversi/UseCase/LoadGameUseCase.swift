import Foundation

protocol LoadGameUseCaseProtocol {
    func execute() throws ->  Board
}

struct LoadGameUseCase {

}

extension LoadGameUseCase: LoadGameUseCaseProtocol {
     func execute() throws -> Board {
        do {
            let fileManager = FileManager.default
            let docs = try fileManager.url(for: .documentDirectory,
                                           in: .userDomainMask,
                                           appropriateFor: nil, create: false)
            let path = docs.appendingPathComponent("Board")

            let boardData = try Data(contentsOf: path)
            return try JSONDecoder().decode(Board.self, from: boardData)
        } catch {
            print(error)
            throw error
        }
        // from: https://qiita.com/shiz/items/c7a9b3218269c5c92fed
    }
}
