//
//  Vec3.swift
//  FirstRayTracer
//
//  Created by Julius Peinelt on 06.07.21.
//

import Foundation
import simd


extension simd_double3 {
    func toColorString() -> String {
        return "\(Int(255.999 * x)) \(Int(255.999 * y)) \(Int(255.999 * z))"
    }
}

