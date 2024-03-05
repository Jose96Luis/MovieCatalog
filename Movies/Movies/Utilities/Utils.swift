//
//  Utils.swift
//  Movies
//
//  Created by José Rodriguez Romero on 04/03/24.
//

import Foundation

struct Utils {
    static let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        // Configura tu decoder aquí, por ejemplo, para manejar fechas
        decoder.dateDecodingStrategy = .iso8601 // o .formatted(DateFormatter.yourCustomFormatter) si tienes un formato de fecha específico
        return decoder
    }()
}
