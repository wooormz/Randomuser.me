import Foundation

public struct Timezone: Codable, CustomStringConvertible, Equatable, Identifiable {
    public let id: UUID
    public let offset: String
    public let description: String
    
    public static func ==(lhs: Timezone, rhs: Timezone) -> Bool {
        return lhs.id == rhs.id && lhs.offset == rhs.offset && lhs.description == rhs.description
    }

    enum CodingKeys: String, CodingKey {
        case offset
        case description = "description"
    }
    
    init(offset: String, description: String) {
        self.offset = offset
        self.description = description
        self.id = UUID()
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        offset = try values.decode(String.self, forKey: .offset)
        description = try values.decode(String.self, forKey: .description)
        id = UUID()
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(offset, forKey: .offset)
        try container.encode(description, forKey: .description)
    }

}