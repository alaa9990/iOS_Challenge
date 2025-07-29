//
//  PopularMoviesViewModelTests.swift
//  iOS_ChallengeTests
//
//  Created by Alaa Hassan on 29/07/2025.
//

import XCTest
import Combine
@testable import iOS_Challenge

final class PopularMoviesViewModelTests: XCTestCase {

    private var cancellables: Set<AnyCancellable> = []

    // MARK: - Mock ViewModel
    final class MockPopularMoviesViewModel: PopularMoviesViewModel {
        var mockResponse: PopularMoviesModel?

        override func requestGeneralResponse<ResponseData: Decodable>(
            _ endPoint: Endpoint<ResponseData>,
            progress: ((_ progress: Int) -> Void)? = nil
        ) async throws -> ResponseData {
            guard let response = mockResponse as? ResponseData else {
                throw NSError(domain: "Mock error", code: 1)
            }
            return response
        }
    }

    func testPopularMoviesApi_SuccessfulResponse_UpdatesModel() {
        let viewModel = MockPopularMoviesViewModel()

        let mockMovie = PopularMoviesResult(
            adult: false,
            backdropPath: "/path.jpg",
            genreIDS: [28],
            id: 42,
            originalLanguage: "en",
            originalTitle: "Popular Original",
            overview: "A popular movie overview.",
            popularity: 99.9,
            posterPath: "/poster.jpg",
            releaseDate: "2025-07-29",
            title: "Popular Movie",
            video: false,
            voteAverage: 8.5,
            voteCount: 2000
        )

        viewModel.mockResponse = PopularMoviesModel(
            page: 1,
            results: [mockMovie],
            totalPages: 1,
            totalResults: 1
        )

        let dataExpectation = expectation(description: "Movies loaded")
        let loadingExpectation = expectation(description: "Loading finished")
        loadingExpectation.expectedFulfillmentCount = 2 // true and false

        var receivedMovies: [PopularMoviesResult] = []
        var loadingStates: [Bool] = []

        viewModel.isLoading
            .sink { isLoading in
                loadingStates.append(isLoading)
                loadingExpectation.fulfill()
            }
            .store(in: &cancellables)

        viewModel.popularMoviesModel
            .dropFirst()
            .sink { movies in
                receivedMovies = movies
                dataExpectation.fulfill()
            }
            .store(in: &cancellables)

        viewModel.popularMoviesApi(page: 1)

        wait(for: [dataExpectation, loadingExpectation], timeout: 2)

        XCTAssertEqual(receivedMovies.count, 1)
        XCTAssertEqual(receivedMovies.first?.title, "Popular Movie")
        XCTAssertEqual(viewModel.currentPageNumber, 1)
        XCTAssertEqual(loadingStates, [true, false])
    }
}
