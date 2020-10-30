protocol StartGameUseCaseProtocol {
    func execute(height: Int, width: Int, blackPlayerStatus: PlayerStatus, whitePlayerStatus: PlayerStatus) -> Board
}

struct StartGameUseCase {

}

extension StartGameUseCase: StartGameUseCaseProtocol {
    func execute(height: Int, width: Int, blackPlayerStatus: PlayerStatus, whitePlayerStatus: PlayerStatus) -> Board {
        return Board(height: 0, width: 0, blackPlayerStatus: .manual, whitePlayerStatus: .computer, currentPlayDisk: .dark, blackCells: [], whiteCells: [])
    }
}
