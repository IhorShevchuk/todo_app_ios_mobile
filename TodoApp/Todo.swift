//
// Created by Ihor Shevchuk on 26.08.2023.
//

import Foundation

final class Todo: Identifiable, ObservableObject, Codable {
    let id: UUID
    @Published var title: String
    @Published var isCompleted: Bool

    init(id: UUID = UUID(), title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case isCompleted
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id.uuidString, forKey: .id)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.isCompleted, forKey: .isCompleted)
    }

    convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let idString = try container.decode(String.self, forKey: .id)
        let title = try container.decode(String.self, forKey: .title)
        let isCompleted = try container.decode(Bool.self, forKey: .isCompleted)
        let id = UUID(uuidString: idString)!
        self.init(id: id, title: title, isCompleted: isCompleted)
    }
}