protocol SaveGameUseCaseProtocol {
    throws func execute(board: Board)
}

struct SaveGameUseCase {

}

extension SaveGameUseCase: SaveGameUseCaseProtocol {
    throws func execute(board: Board) {
        
    }
}
