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
            guard let matcheAddres = (board.blackCells + board.whiteCells)
                .filter ({ (address) -> Bool in
                    return address.x == x && address.y == y
                }).first  else {
                    return nil
            }
            
            if board.blackCells.contains(matcheAddres) {
                return .dark
            } else if board.whiteCells.contains(matcheAddres) {
                return .light
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }
}
