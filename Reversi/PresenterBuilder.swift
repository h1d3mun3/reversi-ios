struct PresenterBuilder {
    static func build(view: ViewControllerProtocol) -> Presenter {
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
        let presenter = Presenter(view: view, saveGameUseCase: saveGameUseCase, loadGameUseCase: loadGameUseCase, countDiskUseCase: countDiskUseCase, getAllPossibleCoordinatesByDiskUseCase: getAllPossibleCoordinatesByDiskUseCase, placeDiskUseCase: placeDiskUseCase)

        return presenter
    }
}
