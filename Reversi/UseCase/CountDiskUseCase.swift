protocol CountDiskUseCaseProtocol {
    func count(disk: Disk) -> Int?
}

struct CountDiskUseCase {
    let loadGameUseCase: LoadGameUseCaseProtocol
}

extension CountDiskUseCase: CountDiskUseCaseProtocol {
    func count(disk: Disk) -> Int? {
        do {
            let board = try loadGameUseCase.execute()

            switch disk {
            case .dark:
                return board.blackCells.count
            case .light:
                return board.whiteCells.count
            }

        } catch {
            return nil
        }
    }
}
