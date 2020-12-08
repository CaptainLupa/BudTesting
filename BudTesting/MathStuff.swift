import Foundation

class weirdMatrix {
	var x: Double = 0
	var y: Double = 0
}

let A = weirdMatrix()
let B = weirdMatrix()
let C = weirdMatrix()
let G = weirdMatrix()
let E = weirdMatrix()

struct swagMath {
	var h      :Double
	var g      :Double
	var at     :Double
	var th     :Double
	var cs     :Double
	var sn     :Double
	var cs1    :Double
	var sn1    :Double
	var d      :Double
	var xg     :Double
	var yg     :Double
	var xo     :Double
	var yo     :Double
	var w      :Double
	var xc     :Double
	var yc     :Double
	var u      :Double
	var lambda :Double
	var xm     :Double
	var j      :Double

	init() {
		h = A.x - B.x
		g = A.y - B.y
		at = atan2(h,g)
		th = at - Double.pi/2.0	// theta, angle of co-ordinate rotation
		cs = cos(th)
		sn = sin(th)
		cs1 = cos(-th)
		sn1 = sin(-th)
		let temp: Double = pow(h, 2) + pow(g, 2)
		d = sqrt(temp)		// IPD in new co-ordinates (NC)
		xg = (G.x-B.x)*cs + (G.y-B.y)*sn 	// G in NC
		yg = (G.y-B.y)*cs - (G.x-B.x)*sn
		xo = B.x*cs + B.y*sn
		yo = B.y*cs - B.x*sn
		w = yg/d 				// fractional height of G in NC
		xc = (C.x-B.x)*cs + (C.y-B.y)*sn 	// C in NC
		yc = (C.y-B.y)*cs - (C.x-B.x)*sn
		u = yc/d 				// fractional height of C in NC
		lambda = 1.0/u - 1.0 			// Lambda estimate
		xm = pow(u, u) * pow(1-u, 1-u)	// max radius assuming mid = 1.0
		j = xc/xm 				// actual mid height diameter for actual max radius
	}
}
