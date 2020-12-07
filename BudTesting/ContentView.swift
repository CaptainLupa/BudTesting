//
//  ContentView.swift
//  BudTesting
//
//  Created by Jens Eckert on 12/7/20.
//

import SwiftUI

struct Hexagon {
	struct Segment {
		let useWidth: (CGFloat, CGFloat, CGFloat)
		let xFactors: (CGFloat, CGFloat, CGFloat)
		let useHeight: (CGFloat, CGFloat, CGFloat)
		let yFactors: (CGFloat, CGFloat, CGFloat)
	}

	static let adjustment: CGFloat = 0.085

	static let points = [
			Segment(
				useWidth:  (1.00, 1.00, 1.00),
				xFactors:  (0.60, 0.40, 0.50),
				useHeight: (1.00, 1.00, 0.00),
				yFactors:  (0.05, 0.05, 0.00)
			),
			Segment(
				useWidth:  (1.00, 1.00, 0.00),
				xFactors:  (0.05, 0.00, 0.00),
				useHeight: (1.00, 1.00, 1.00),
				yFactors:  (0.20 + adjustment, 0.30 + adjustment, 0.25 + adjustment)
			),
			Segment(
				useWidth:  (1.00, 1.00, 0.00),
				xFactors:  (0.00, 0.05, 0.00),
				useHeight: (1.00, 1.00, 1.00),
				yFactors:  (0.70 - adjustment, 0.80 - adjustment, 0.75 - adjustment)
			),
			Segment(
				useWidth:  (1.00, 1.00, 1.00),
				xFactors:  (0.40, 0.60, 0.50),
				useHeight: (1.00, 1.00, 1.00),
				yFactors:  (0.95, 0.95, 1.00)
			),
			Segment(
				useWidth:  (1.00, 1.00, 1.00),
				xFactors:  (0.95, 1.00, 1.00),
				useHeight: (1.00, 1.00, 1.00),
				yFactors:  (0.80 - adjustment, 0.70 - adjustment, 0.75 - adjustment)
			),
			Segment(
				useWidth:  (1.00, 1.00, 1.00),
				xFactors:  (1.00, 0.95, 1.00),
				useHeight: (1.00, 1.00, 1.00),
				yFactors:  (0.30 + adjustment, 0.20 + adjustment, 0.25 + adjustment)
			)
		]
}

struct TestGeometry: View {
    var body: some View {
		Path { path in
			var width: CGFloat = 100.0
			let height = width
			path.move(to: CGPoint(x: width * 0.95, y: height * 0.20))

			Hexagon.points.forEach {
				path.addLine(
					to: .init(
						x: width * $0.useWidth.0 * $0.xFactors.0,
						y: height * $0.useHeight.0 * $0.yFactors.0
					)
				)
			}
		}
		.fill(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			TestGeometry()
		}
    }
}
