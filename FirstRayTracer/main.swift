//
//  main.swift
//  FirstRayTracer
//
//  Created by Julius Peinelt on 05.07.21.
//

import Foundation
import simd


func main() {
    // Image
    let aspectRatio = 16.0 / 9.0
    let imageWidth = 400
    let imageHeight = Int(Double(imageWidth) / aspectRatio)

    // Camera
    let viewportHeight = 2.0
    let viewportWidth = aspectRatio * viewportHeight
    let focalLength = 1.0

    let origin = simd_double3.zero
    let horizontal = simd_make_double3(viewportWidth, 0.0, 0.0)
    let vertical = simd_make_double3(0.0, viewportHeight, 0.0)

    let left: simd_double3 = horizontal / 2.0
    let bottom: simd_double3 = vertical / 2.0
    let lowerLeftCorner = origin - left - bottom - simd_make_double3(0.0, 0.0, focalLength)

    // Render & Scene
    let sphere = Sphere(center: simd_make_double3(0.0, 0.0, -1.0), radius: 0.5)

    var pixelData: [simd_double3] = []

    for h in (0..<imageHeight).reversed() {
        print("Scanlines remaining: \(h)")
        for w in 0..<imageWidth {
            let u = Double(w) / Double(imageWidth - 1)
            let v = Double(h) / Double(imageHeight - 1)
            let r = Ray(origin: origin, direction: lowerLeftCorner + u * horizontal + v * vertical - origin)

            pixelData.append(r.color(renderable: sphere))
        }

    }

    
    let ppm = PPMExporter(fileName: "render")
    ppm.export(width: imageWidth, height: imageHeight, pixelData: pixelData )
}

main()
