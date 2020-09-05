import Foundation
import UIKit

extension String{
    var htmlStripped : String{
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }

    init?(htmlEncodedString: String) {

        guard let data = htmlEncodedString.data(using: .utf8) else {
            return nil
        }

        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]

        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return nil
        }

        self.init(attributedString.string)

    }
}

struct NewsList: Decodable {
    var results = [News]()
}

struct Image : Codable{
    var source: String
}

struct News : Identifiable, Codable {
    var id: Int
    var title: String
    var excerpt: String
    var link: String
    var content: String
    var featured_image:Image
    
    enum CodingKeys: String, CodingKey {
         case id = "ID"
         case title = "title"
         case excerpt = "excerpt"
         case link = "link"
         case content = "content"
         case featured_image
     }

    func removeHTML(text:String) -> String {
        let str = text.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        return str
    }
}

 let url = URL(string: "https://webdmg.com/blog/wp-json/posts?filter[posts_per_page]=13&filter[order]=DESC")

URLSession.shared.dataTask(with: url!) { (data,response,error) in
    guard let data = data else { return }
    let news = try! JSONDecoder().decode([News].self, from: data)
    print(String(htmlEncodedString:news[0].content.htmlStripped)!)

}.resume()

struct ApplistList: Decodable {
    var results = [Apps]()
}

struct Apps: Decodable {
    let resultCount: Int?
    let results: [App]?
}

 struct App : Identifiable, Decodable {
     var id: Int
     var trackName: String
     var description: String
     var artworkUrl512: String

     enum CodingKeys: String, CodingKey {
          case id = "trackId"
          case trackName = "trackName"
          case description = "description"
          case artworkUrl512 = "artworkUrl512"
      }
}

 let url1 = URL(string: "https://itunes.apple.com/search?term=webdmg&country=us&entity=software")

URLSession.shared.dataTask(with: url1!) { (data,response,error) in
    guard let data = data else { return }
    let news = try! JSONDecoder().decode(Apps.self, from: data)
   print(news)

}.resume()

