protocol SaveGameUseCaseProtocol {
    func execute(board: Board) throws
}

struct SaveGameUseCase {

}

extension SaveGameUseCase: SaveGameUseCaseProtocol {
    func execute(board: Board) throws {
        
    }
}
