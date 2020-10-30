protocol PlaceDiskUseCaseProtocol {
    func placeDisk(disk: Disk, address: Address) throws -> Board
}

struct PlaceDiskUseCase {
    let loadGameUseCase: LoadGameUseCaseProtocol
    let getAllCoordinatesAffectedUseCase: GetAllCoordinatesAffectedUseCaseProtocol
}

extension PlaceDiskUseCase: PlaceDiskUseCaseProtocol {
    func placeDisk(disk: Disk, address: Address) throws -> Board {
        let coodinatesAffected = getAllCoordinatesAffectedUseCase.flippedDiskCoordinatesByPlacingDisk(disk, atX: address.x, y: address.y)
        if coodinatesAffected.isEmpty {
            throw DiskPlacementError(disk: disk, x: address.x, y: address.y)
        }

        let oldBoard = try loadGameUseCase.execute()

        var blackCells = [Address]()
        var whiteCells = [Address]()
        switch disk {
        case .dark:
            blackCells += oldBoard.blackCells
            blackCells += coodinatesAffected.filter({ !oldBoard.blackCells.contains($0) })
            blackCells.append(address)

            whiteCells += oldBoard.whiteCells.filter({ !coodinatesAffected.contains($0) })
        case .light:
            whiteCells += oldBoard.whiteCells
            whiteCells += coodinatesAffected.filter({ !oldBoard.whiteCells.contains($0) })
            whiteCells.append(address)

            blackCells += oldBoard.blackCells.filter({ !coodinatesAffected.contains($0) })
        }

        return Board(
            height: oldBoard.height,
            width: oldBoard.width,
            blackPlayerStatus: oldBoard.blackPlayerStatus,
            whitePlayerStatus: oldBoard.whitePlayerStatus,
            currentPlayDisk: oldBoard.currentPlayDisk,
            blackCells: blackCells,
            whiteCells: whiteCells
        )
    }
}
