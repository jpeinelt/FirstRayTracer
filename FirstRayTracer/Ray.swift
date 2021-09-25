//
//  Ray.swift
//  FirstRayTracer
//
//  Created by Julius Peinelt on 08.07.21.
//

import Foundation
import simd

struct Ray {
    // TODO: add empty constructor for zero initialized origin and direction

    private(set) var origin: simd_double3
    private(set) var direction: simd_double3

    func at(t: Double) -> simd_double3 {
        return origin + t * direction
    }

    func color(renderable: Renderable?) -> simd_double3 {
        if let renderable = renderable {
            let hit = renderable.hit(with: self, tMin: 0.0, tMax: 1.0)
            if let hit = hit {
                let n = simd_normalize(hit.p - simd_double3(0.0, 0.0, -1.0))
                return 0.5 * simd_double3(n.x + 1, n.y + 1, n.z + 1);
            }
        }

        let unitDirection = simd_normalize(direction)
        let t = 0.5 * (unitDirection.y + 1.0)

        return (1.0 - t) * simd_double3.one + t * simd_double3(0.5, 0.7, 1.0)
    }
}
