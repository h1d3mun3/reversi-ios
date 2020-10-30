protocol LoadGameUseCaseProtocol {
    func execute() throws ->  Board
}

struct LoadGameUseCase {

}

extension LoadGameUseCase: LoadGameUseCaseProtocol {
     func execute() throws -> Board {
        return Board(height: 0, width: 0, blackPlayerStatus: .manual, whitePlayerStatus: .human, currentPlayDisk: .black, blackCells: [], whiteCells: [])
    }
}
