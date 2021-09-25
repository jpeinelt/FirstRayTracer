//
//  Sphere.swift
//  FirstRayTracer
//
//  Created by Julius Peinelt on 11.07.21.
//

import Foundation
import simd

struct Sphere: Renderable {
    private(set) var center: simd_double3
    private(set) var radius: Double

    func hit(with ray: Ray, tMin: Double, tMax: Double) -> Hit? {
        // remember the midnight formula: (-b ± sqrt(b*b - 4ac)) / 2a
        let oc = ray.origin - center
        let a = simd_length_squared(ray.direction)
        let halfB = simd_dot(oc, ray.direction)
        let c = simd_length_squared(oc) - radius*radius
        let discriminant = halfB * halfB - a * c

        if discriminant < 0 {
            return nil
        }

        let sqrtD = sqrt(discriminant)
        var root = (-halfB - sqrtD) / a

        if root < tMin || root > tMax {
            root = (-halfB + sqrtD) / a

            if root < tMin || root > tMax {
                return nil
            }
        }

        let t = root
        let p = ray.at(t: t)
        let normal = (p - center) / radius

        return Hit(p: p, normal: normal, t: t)
    }

}
