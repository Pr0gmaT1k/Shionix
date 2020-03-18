/* DO NOT EDIT | Generated by gyro */

import RealmSwift
import Foundation

final class SearchResult: Object, Decodable {
  private enum Keys: String, CodingKey {
    case responseCode = "responseCode"
    case result = "result"

    }

  let responseCode = RealmOptional<Int16>()
  @objc dynamic var result: SearchItems?




  convenience required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: Keys.self)
    let responseCode = try? container.decode(Int16?.self, forKey: .responseCode)
    let result = try? container.decode(SearchItems?.self, forKey: .result)
    self.init(responseCode: responseCode, result: result)
  }

  convenience init(responseCode: Int16?, result: SearchItems?) {
    self.init()
    self.responseCode.value = responseCode
    self.result = result

  }
}
