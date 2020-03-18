/* DO NOT EDIT | Generated by gyro */

import RealmSwift
import Foundation

final class SearchResult: Object, Decodable {
  private enum Keys: String, CodingKey {
    case responseCode = "responseCode"
    case result = "result"

    }

  @objc dynamic var responseCode: String?
  @objc dynamic var result: SearchItems?




  convenience required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: Keys.self)
    let responseCode = try? container.decode(String?.self, forKey: .responseCode)
    let result = try? container.decode(SearchItems?.self, forKey: .result)
    self.init(responseCode: responseCode, result: result)
  }

  convenience init(responseCode: String?, result: SearchItems?) {
    self.init()
    self.responseCode = responseCode
    self.result = result

  }
}
