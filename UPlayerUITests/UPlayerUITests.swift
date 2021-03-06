//
//  UPlayerUITests.swift
//  UPlayerUITests
//
//  Created by abuzeid on 05.01.21.
//  Copyright © 2021 abuzeid. All rights reserved.
//

import XCTest

final class UPlayerUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launchArguments.append("--uitesting")
        app.launch()
    }

    func testNavigationBetweenAppScreensForTheHappyPathScenario() throws {
        func assertPopulerTracksExistsThenSelectFirstTrack() {
            let artistsTable = app.tables["PopulerTracksTable"]
            XCTAssertTrue(artistsTable.waitForExistence(timeout: 0.2))
            artistsTable.cells.firstMatch.tap()
        }
        func assertArtistTracksListExistsThenPlayTrack() {
            XCTAssertTrue(app.tables["SongsTable"].waitForExistence(timeout: 0.02))
            app.tables["SongsTable"].cells.firstMatch.tap()
        }

        func assertFullScreenPlayerViewExistThenSwipeDown() {
            XCTAssertTrue(app.otherElements["FullScreenPlayer"].waitForExistence(timeout: 0.2))
            app.swipeDown(velocity: 2000)
        }
        func assertMiniPlayerViewExistAfterNavigationBack() {
            XCTAssertTrue(app.otherElements["PlayerView"].waitForExistence(timeout: 0.02))
            XCTAssertTrue(app.buttons["play"].exists)
            app.buttons["play"].tap()
            app.navigationBars.buttons.element(boundBy: 0).tap()
            XCTAssertTrue(app.otherElements["PlayerView"].exists)
        }
        assertPopulerTracksExistsThenSelectFirstTrack()
        assertArtistTracksListExistsThenPlayTrack()
        assertFullScreenPlayerViewExistThenSwipeDown()
        assertMiniPlayerViewExistAfterNavigationBack()
    }
}
