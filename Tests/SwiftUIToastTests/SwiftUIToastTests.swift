import XCTest
@testable import SwiftUIToast

final class SwiftUIToastTests: XCTestCase {

    func testToastStyleInitialization() {
        let customStyle = ToastStyle(
            backgroundColor: .red,
            icon: Image(systemName: "star")
        )

        XCTAssertEqual(customStyle.backgroundColor, .red)
        // Note: Icon comparison would require more complex testing
    }

    func testToastManagerSharedInstance() {
        let manager1 = ToastManager.shared
        let manager2 = ToastManager.shared

        XCTAssert(manager1 === manager2, "ToastManager should be a singleton")
    }

    func testToastManagerShowToast() {
        let manager = ToastManager.shared
        let expectation = XCTestExpectation(description: "Toast should be shown")

        manager.show(message: "Test message", style: .success)

        // Wait a bit for the toast to be set
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertNotNil(manager.currentToast)
            XCTAssertEqual(manager.currentToast?.message, "Test message")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func testToastManagerDismissToast() {
        let manager = ToastManager.shared

        manager.show(message: "Test message", style: .success)
        manager.dismiss()

        XCTAssertNil(manager.currentToast)
    }

    func testToastInitialization() {
        let toast = Toast(message: "Test", style: .info, duration: 2.0)

        XCTAssertEqual(toast.message, "Test")
        XCTAssertEqual(toast.duration, 2.0)
        XCTAssertEqual(toast.style.backgroundColor, .blue)
    }
}