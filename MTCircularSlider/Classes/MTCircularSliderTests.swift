//
//  MTCircularSliderTests.swift
//  MTCircularSliderTests
//
//  Created by Eran Boudjnah on 31/05/2016.
//
//

import XCTest
@testable import MTCircularSlider

class MyClassTests: XCTestCase {
	var slider: MTCircularSlider? = nil
	
	override func setUp() {
		super.setUp()
		
		slider = MTCircularSlider(frame: CGRect(origin: CGPointZero, size: CGSize(width: 100, height: 100)))
	}
	
	override func tearDown() {
		slider = nil
		
		super.tearDown()
	}
	
	func testDefaultValueAndLimits() {
		let slider = self.slider!
		XCTAssertEqual(slider.value, 0.5)
		XCTAssertEqual(slider.valueMinimum, 0)
		XCTAssertEqual(slider.valueMaximum, 1)
	}
	
	func testValueManipulation() {
		let slider = self.slider!
		slider.valueMinimum = -100
		XCTAssertEqual(slider.valueMinimum, -100)
		slider.valueMaximum = 100
		XCTAssertEqual(slider.valueMaximum, 100)
		slider.value = 0
		XCTAssertEqual(slider.value, 0)
		slider.value = -110
		XCTAssertEqual(slider.value, -100)
		slider.valueMinimum = -90
		XCTAssertEqual(slider.valueMinimum, -90)
		XCTAssertEqual(slider.value, -90)
		
		slider.value = 110
		XCTAssertEqual(slider.value, 100)
		
		slider.valueMaximum = 90
		XCTAssertEqual(slider.valueMaximum, 90)
		XCTAssertEqual(slider.value, 90)
	}
	
	func testAttributeSetting() {
		let slider = self.slider!
		
		/* Track */
		XCTAssertEqual(slider.minTrackTint, UIColor(red: 0.0, green: 0.478, blue: 1.0, alpha: 1.0))
		XCTAssertEqual(slider.maxTrackTint, UIColor(red: 0.71, green: 0.71, blue: 0.71, alpha: 1.0))
		XCTAssertEqual(slider.trackWidth, 2)
		XCTAssertEqual(slider.trackShadowRadius, 0)
		XCTAssertEqual(slider.trackShadowDepth, 0)
		XCTAssertEqual(slider.trackMinAngle, 0)
		XCTAssertEqual(slider.trackMaxAngle, 360)
		
		/* Thumb */
		XCTAssertEqual(slider.hasThumb, true)
		XCTAssertEqual(slider.thumbTint, UIColor.whiteColor())
		XCTAssertEqual(slider.thumbRadius, 14)
		XCTAssertEqual(slider.thumbShadowRadius, 2)
		XCTAssertEqual(slider.thumbShadowDepth, 3)
		
		let newAttributes: [Attributes] = [
			/* Track */
			.minTrackTint(UIColor.blackColor()),
			.maxTrackTint(UIColor.redColor()),
			.trackWidth(10),
			.trackShadowRadius(5),
			.trackShadowDepth(4),
			.trackMinAngle(90),
			.trackMaxAngle(270),
			
			/* Thumb */
			.hasThumb(false),
			.thumbTint(UIColor.greenColor()),
			.thumbRadius(8),
			.thumbShadowRadius(0),
			.thumbShadowDepth(4)
		]
		
		slider.configure(newAttributes)
		
		/* Track */
		XCTAssertEqual(slider.minTrackTint, UIColor.blackColor())
		XCTAssertEqual(slider.maxTrackTint, UIColor.redColor())
		XCTAssertEqual(slider.trackWidth, 10)
		XCTAssertEqual(slider.trackShadowRadius, 5)
		XCTAssertEqual(slider.trackShadowDepth, 4)
		XCTAssertEqual(slider.trackMinAngle, 90)
		XCTAssertEqual(slider.trackMaxAngle, 270)
		
		/* Thumb */
		XCTAssertEqual(slider.hasThumb, false)
		XCTAssertEqual(slider.thumbTint, UIColor.greenColor())
		XCTAssertEqual(slider.thumbRadius, 8)
		XCTAssertEqual(slider.thumbShadowRadius, 0)
		XCTAssertEqual(slider.thumbShadowDepth, 4)
	}
}