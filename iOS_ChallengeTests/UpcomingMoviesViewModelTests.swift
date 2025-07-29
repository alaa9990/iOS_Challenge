//
//  UpcomingMoviesViewModelTests.swift
//  iOS_ChallengeTests
//
//  Created by Alaa Hassan on 29/07/2025.
//

import XCTest
import Combine
@testable import iOS_Challenge

final class UpcomingMoviesViewModelTests: XCTestCase {
    
    private var cancellables: Set<AnyCancellable> = []

    // MARK: - Mock ViewModel
    final class MockUpcomingMoviesViewModel: UpcomingMoviesViewModel {
        var mockResponse: UpcomingMoviesModel?

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

    func testUpcomingMoviesApi_SuccessfulResponse_UpdatesModel() {
        let viewModel = MockUpcomingMoviesViewModel()

        let mockMovie = UpcomingMoviesResult(
            adult: false,
            backdropPath: "/upcoming_path.jpg",
            genreIDS: [18, 878],
            id: 99,
            originalLanguage: "en",
            originalTitle: "Upcoming Original",
            overview: "A future blockbuster",
            popularity: 88.8,
            posterPath: "/upcoming_poster.jpg",
            releaseDate: "2025-08-01",
            title: "Upcoming Movie",
            video: false,
            voteAverage: 9.0,
            voteCount: 150
        )

        viewModel.mockResponse = UpcomingMoviesModel(
            page: 1,
            results: [mockMovie],
            totalPages: 1,
            totalResults: 1
        )

        let dataExpectation = expectation(description: "Upcoming movies loaded")
        let loadingExpectation = expectation(description: "Loading started and stopped")
        loadingExpectation.expectedFulfillmentCount = 2

        var receivedMovies: [UpcomingMoviesResult] = []
        var loadingStates: [Bool] = []

        viewModel.isLoading
            .sink { isLoading in
                loadingStates.append(isLoading)
                loadingExpectation.fulfill()
            }
            .store(in: &cancellables)

        viewModel.upcomingMoviesModel
            .dropFirst()
            .sink { movies in
                receivedMovies = movies
                dataExpectation.fulfill()
            }
            .store(in: &cancellables)

        viewModel.upcomingMoviesApi(page: 1)

        wait(for: [dataExpectation, loadingExpectation], timeout: 2)

        XCTAssertEqual(receivedMovies.count, 1)
        XCTAssertEqual(receivedMovies.first?.title, "Upcoming Movie")
        XCTAssertEqual(viewModel.currentPageNumber, 1)
        XCTAssertEqual(loadingStates, [true, false])
    }
}
