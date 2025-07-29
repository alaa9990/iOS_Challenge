//
//  iOS_ChallengeTests.swift
//  iOS_ChallengeTests
//
//  Created by Alaa Hassan on 28/07/2025.
//

import XCTest
import Combine
@testable import iOS_Challenge

final class NowPlayingMoviesViewModelTests: XCTestCase {

    private var cancellables: Set<AnyCancellable> = []

    // MARK: - Mock ViewModel with fake network result
    final class MockNowPlayingMoviesViewModel: NowPlayingMoviesViewModel {
        var mockResponse: NowPlayingModel?

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

    func testNowPlayingMoviesApi_SuccessfulResponse_UpdatesModel() {
        let viewModel = MockNowPlayingMoviesViewModel()

        let mockMovie = NowPlayingModelResult(
            adult: false,
            backdropPath: "/path.jpg",
            genreIDS: [28],
            id: 1,
            originalLanguage: "en",
            originalTitle: "Test Movie",
            overview: "Overview",
            popularity: 10.0,
            posterPath: "/poster.jpg",
            releaseDate: "2025-07-29",
            title: "Mock Movie",
            video: false,
            voteAverage: 8.0,
            voteCount: 100
        )

        viewModel.mockResponse = NowPlayingModel(
            dates: nil,
            page: 1,
            results: [mockMovie],
            totalPages: 1,
            totalResults: 1
        )

        let dataExpectation = expectation(description: "Movies loaded")
        let loadingExpectation = expectation(description: "Loading finished")
        loadingExpectation.expectedFulfillmentCount = 2

        var receivedMovies: [NowPlayingModelResult] = []
        var loadingStates: [Bool] = []

        viewModel.isLoading
            .sink { isLoading in
                loadingStates.append(isLoading)
                loadingExpectation.fulfill()
            }
            .store(in: &cancellables)

        viewModel.nowPlayingMoviesModel
            .dropFirst()
            .sink { movies in
                receivedMovies = movies
                dataExpectation.fulfill()
            }
            .store(in: &cancellables)

        viewModel.nowPlayingMoviesApi(page: 1)

        wait(for: [dataExpectation, loadingExpectation], timeout: 2)

        XCTAssertEqual(receivedMovies.count, 1)
        XCTAssertEqual(receivedMovies.first?.title, "Mock Movie")
        XCTAssertEqual(loadingStates, [true, false])
    }

}
