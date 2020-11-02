struct PresenterBuilder {
    static func build() -> Presenter {
        let saveGameUseCase = SaveGameUseCase()
        let loadGameUseCase = LoadGameUseCase()
        let countDiskUseCase = CountDiskUseCase(loadGameUseCase: LoadGameUseCase())
        let getAllPossibleCoordinatesByDiskUseCase = GetAllPossibleCoordinatesByDiskUseCase(
            loadGameUseCase: LoadGameUseCase(),
            getAllCoordinatesAffectedUseCase: GetAllCoordinatesAffectedUseCase(getDiskFromBoardUseCase: GetDiskFromBoardUseCase(loadGameUseCase: LoadGameUseCase())))
        let placeDiskUseCase = PlaceDiskUseCase(loadGameUseCase: LoadGameUseCase(),
                                                getAllCoordinatesAffectedUseCase: GetAllCoordinatesAffectedUseCase(
                                                    getDiskFromBoardUseCase: GetDiskFromBoardUseCase(loadGameUseCase: LoadGameUseCase()
                                                ))
        )
        let presenter = Presenter(saveGameUseCase: saveGameUseCase, loadGameUseCase: loadGameUseCase, countDiskUseCase: countDiskUseCase, getAllPossibleCoordinatesByDiskUseCase: getAllPossibleCoordinatesByDiskUseCase, placeDiskUseCase: placeDiskUseCase)

        return presenter
    }
}
