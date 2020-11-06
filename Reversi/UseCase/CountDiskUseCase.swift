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

            return board.count(disk: disk)
        } catch {
            return nil
        }
    }
}
