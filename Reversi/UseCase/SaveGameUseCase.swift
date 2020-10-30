import Foundation

protocol SaveGameUseCaseProtocol {
    func execute(board: Board) throws
}

struct SaveGameUseCase {

}

extension SaveGameUseCase: SaveGameUseCaseProtocol {
    func execute(board: Board) throws {
        do {
            let fileManager = FileManager.default
            let data = try JSONEncoder().encode(board)
            let docs = try fileManager.url(for: .documentDirectory,
                                           in: .userDomainMask,
                                           appropriateFor: nil, create: false)
            let path = docs.appendingPathComponent("Board")

            fileManager.createFile(atPath: path.path,
                                   contents: data,
                                   attributes: nil)
        } catch {
            print(error)
            throw error
        }
        // from: https://qiita.com/shiz/items/c7a9b3218269c5c92fed
    }
}
