/* DO NOT EDIT | Generated by gyro */

import RealmSwift
import Foundation

final class SearchItem: Object, Decodable {
  private enum Keys: String, CodingKey {
    case name = "name"
    case detail = "detail"

    }

  @objc dynamic var name: String?
  @objc dynamic var detail: SearchDetail?




  convenience required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: Keys.self)
    let name = try? container.decode(String?.self, forKey: .name)
    let detail = try? container.decode(SearchDetail?.self, forKey: .detail)
    self.init(name: name, detail: detail)
  }

  convenience init(name: String?, detail: SearchDetail?) {
    self.init()
    self.name = name
    self.detail = detail

  }
}