protocol GetAllPossibleCoordinatesByDiskUseCaseProtocol {
    func execute(disk: Disk) -> [Address]
}

struct GetAllPossibleCoordinatesByDiskUseCase {
    let loadGameUseCase: LoadGameUseCaseProtocol
    let getAllCoordinatesAffectedUseCase: GetAllCoordinatesAffectedUseCaseProtocol
}

extension GetAllPossibleCoordinatesByDiskUseCase: GetAllPossibleCoordinatesByDiskUseCaseProtocol {
    func execute(disk: Disk) -> [Address] {
        do {
            let board = try loadGameUseCase.execute()
            return board.getAllPossibleCoordinatesByDisk(disk: disk)
        } catch {
            return []
        }
    }
}
