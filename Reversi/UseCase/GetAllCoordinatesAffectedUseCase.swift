protocol GetAllCoordinatesAffectedUseCaseProtocol {
    func flippedDiskCoordinatesByPlacingDisk(_ disk: Disk, atX x: Int, y: Int) -> [Address]
}

struct GetAllCoordinatesAffectedUseCase {
    let loadGameUseCase: LoadGameUseCaseProtocol
    let getDiskFromBoardUseCase: GetDiskFromBoardUseCaseProtocol
}

extension GetAllCoordinatesAffectedUseCase: GetAllCoordinatesAffectedUseCaseProtocol {
    func flippedDiskCoordinatesByPlacingDisk(_ disk: Disk, atX x: Int, y: Int) -> [Address] {
        do {
            let board = try loadGameUseCase.execute()

            return board.flippedDiskCoordinatesByPlacingDisk(disk, atX: x, y: y)
        } catch {
            return []
        }
    }
}
