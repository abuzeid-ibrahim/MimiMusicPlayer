//
//  MimiMusicPlayerUITests.swift
//  MimiMusicPlayerUITests
//
//  Created by abuzeid on 24.11.20.
//  Copyright © 2020 abuzeid. All rights reserved.
//

import XCTest

final class MimiMusicPlayerUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testNavigationBetweenAppScreensForTheHappyPathScenario() throws {
        let app = XCUIApplication()
        app.launchArguments.append("--uitesting")
        app.launch()
        func assertArtistsListExistsThenSelectFirstArtist() {
            let artistsTable = app.tables["ArtistsTable"]
            XCTAssertTrue(artistsTable.exists)
            artistsTable.cells.firstMatch.tap()
        }
        func assertSongsListExistsThenPlayFirstSong() {
            XCTAssertTrue(app.tables["SongsTable"].exists)
            app.tables["SongsTable"].cells.firstMatch.tap()
        }

        func assertFullScreenPlayerViewExist() {
            XCTAssertTrue(app.otherElements["FullScreenPlayer"].exists)
            app.swipeDown(velocity: 2000)
        }
        func assertPlayerViewExistAfterNavigationBack() {
            XCTAssertTrue(app.otherElements["PlayerView"].waitForExistence(timeout: 0.01))
            XCTAssertTrue(app.buttons["play"].exists)
            app.buttons["play"].tap()
            app.navigationBars.buttons.element(boundBy: 0).tap()
            XCTAssertTrue(app.otherElements["PlayerView"].exists)
        }
        assertArtistsListExistsThenSelectFirstArtist()
        assertSongsListExistsThenPlayFirstSong()
        assertFullScreenPlayerViewExist()
        assertPlayerViewExistAfterNavigationBack()
    }
}
