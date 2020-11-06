protocol GetDiskFromBoardUseCaseProtocol {
    func diskAt(x: Int, y: Int) -> Disk?
}

struct GetDiskFromBoardUseCase {
    let loadGameUseCase: LoadGameUseCaseProtocol
}

extension GetDiskFromBoardUseCase: GetDiskFromBoardUseCaseProtocol {
    func diskAt(x: Int, y: Int) -> Disk? {
        do  {
            let board = try loadGameUseCase.execute()

            return board.diskAt(x: x, y: y)
        } catch {
            return nil
        }
    }
}
