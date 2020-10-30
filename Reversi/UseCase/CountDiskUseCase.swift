protocol CountDiskUseCaseProtocol {
    func count(disk: Disk) -> Int
}

struct CountDiskUseCase {

}

extension CountDiskUseCase: CountDiskUseCaseProtocol {
    func count(disk: Disk) -> Int {
        return Int.min
    }
}
