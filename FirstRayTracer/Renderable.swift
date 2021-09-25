//
//  Renderable.swift
//  FirstRayTracer
//
//  Created by Julius Peinelt on 25.09.21.
//

import Foundation
import simd

struct Hit {
    let p: simd_double3
    let normal: simd_double3
    let t: Double
}

protocol Renderable {
    func hit(with ray: Ray, tMin: Double, tMax: Double) -> Hit?
}
