protocol PlaceDiskUseCaseProtocol {
    func placeDisk(disk: Disk, address: Address) throws -> Board
}

struct PlaceDiskUseCase {
    let loadGameUseCase: LoadGameUseCaseProtocol
    let getAllCoordinatesAffectedUseCase: GetAllCoordinatesAffectedUseCaseProtocol
}

extension PlaceDiskUseCase: PlaceDiskUseCaseProtocol {
    func placeDisk(disk: Disk, address: Address) throws -> Board {
        var board = try loadGameUseCase.execute()
        try board.placeDisk(disk: disk, address: address)

        return board
    }
}
