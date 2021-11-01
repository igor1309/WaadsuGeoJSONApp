//
//  Double+convert.swift
//  WaadsuGeoJSONApp
//
//  Created by Igor Malyarov on 01.11.2021.
//

import Foundation

extension Double {
    /// Convert units of the same unit of measure.
    ///
    /// For example,
    /// ```swift
    ///     let length: Double
    ///     // ...
    ///     length.convert(from: .meters, to: .kilometers)
    /// ```
    func convert(
        from originalUnit: UnitLength,
        to convertedUnit: UnitLength
    ) -> Double {
        Measurement(
            value: self,
            unit: originalUnit
        )
            .converted(to: convertedUnit)
            .value
    }
}
