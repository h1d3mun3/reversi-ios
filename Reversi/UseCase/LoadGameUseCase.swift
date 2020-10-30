protocol LoadGameUseCaseProtocol {
    func execute() throws ->  Board
}

struct LoadGameUseCase {

}

extension LoadGameUseCase: LoadGameUseCaseProtocol {
     func execute() throws -> Board {
        
    }
}
