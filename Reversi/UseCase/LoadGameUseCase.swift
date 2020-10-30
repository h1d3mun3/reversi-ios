protocol LoadGameUseCaseProtocol {
    throws func execute() -> Board
}

struct LoadGameUseCase {

}

extension LoadGameUseCase: LoadGameUseCaseProtocol {
    throws func execute() -> Board {
        
    }
}
