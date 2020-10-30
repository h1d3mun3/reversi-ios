protocol PlaceDiskUseCaseProtocol {
    func placeDisk(disk: Disk, address: Address) -> Board
}

struct PlaceDiskUseCase {

}

extension PlaceDiskUseCase: PlaceDiskUseCaseProtocol {
    func placeDisk(disk: Disk, address: Address) -> Board {

    }
}
