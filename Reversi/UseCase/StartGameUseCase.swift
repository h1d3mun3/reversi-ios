protocol StartGameUseCaseProtocol {
    func execute(height: Int, width: Int, blackPlayerStatus: PlayerStatus, whitePlayerStatus: PlayerStatus) -> Board
}

struct StartGameUseCase {

}

extension StartGameUseCase: StartGameUseCaseProtocol {
    func execute(height: Int, width: Int, blackPlayerStatus: PlayerStatus, whitePlayerStatus: PlayerStatus) -> Board {
        
    }
}
