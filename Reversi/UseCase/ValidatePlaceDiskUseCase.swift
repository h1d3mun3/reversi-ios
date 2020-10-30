protocol ValidatePlaceDiskUseCaseProtocol {
    func execute(disk: Disk) -> [Address]
}

struct ValidatePlaceDiskUseCase {

}

extension ValidatePlaceDiskUseCase: ValidatePlaceDiskUseCaseProtocol {
    func execute(disk: Disk) -> [Address] {
        return []
    }
}
