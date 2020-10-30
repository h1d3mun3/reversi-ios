protocol GetAllPossibleCoordinatesByDiskUseCaseProtocol {
    func execute(disk: Disk) -> [Address]
}

struct GetAllPossibleCoordinatesByDiskUseCase {
    let loadGameUseCase: LoadGameUseCaseProtocol
    let getAllCoordinatesAffectedUseCase: GetAllCoordinatesAffectedUseCaseProtocol
}

extension GetAllPossibleCoordinatesByDiskUseCase: GetAllPossibleCoordinatesByDiskUseCaseProtocol {
    func execute(disk: Disk) -> [Address] {
        let board: Board
        do {
             board = try loadGameUseCase.execute()
        } catch {
            return []
        }

        let widthRange: Range<Int> = 0 ..< board.width
        let heigthRange: Range<Int> = 0 ..< board.height
        var coordinates =  [Address]()

        for y in heigthRange {
            for x in widthRange {
                if !getAllCoordinatesAffectedUseCase.flippedDiskCoordinatesByPlacingDisk(disk, atX: x, y: y).isEmpty {
                    coordinates.append(Address(x: x, y: y))
                }
            }
        }

        return coordinates
    }
}
