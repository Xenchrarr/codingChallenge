/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
import CoreData
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Items: Equatable{
    public static func ==(lhs: Items, rhs: Items) -> Bool {
        return lhs.id == rhs.id
    }
    
	public var image : Image?
	public var score : Double?
	public var adType : String?
	public var price : Price?
	public var description : String?
	public var location : String?
	public var id : Int?
	public var type : String?
	public var tracking : Tracking?
	public var actions : Actions?
	public var version : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let items_list = Items.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Items Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Items]
    {
        var models:[Items] = []
        for item in array
        {
            models.append(Items(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let items = Items(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Items Instance.
*/
	required public init?(dictionary: NSDictionary) {

		if (dictionary["image"] != nil) { image = Image(dictionary: dictionary["image"] as! NSDictionary) }
		score = dictionary["score"] as? Double
		adType = dictionary["ad-type"] as? String
		if (dictionary["price"] != nil) { price = Price(dictionary: dictionary["price"] as! NSDictionary) }
		description = dictionary["description"] as? String
		location = dictionary["location"] as? String
		id = dictionary["id"] as? Int
		type = dictionary["type"] as? String
		if (dictionary["tracking"] != nil) { tracking = Tracking(dictionary: dictionary["tracking"] as! NSDictionary) }
		if (dictionary["actions"] != nil) { actions = Actions(dictionary: dictionary["actions"] as! NSDictionary) }
		version = dictionary["version"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.image?.dictionaryRepresentation(), forKey: "image")
		dictionary.setValue(self.score, forKey: "score")
		dictionary.setValue(self.adType, forKey: "ad-type")
		dictionary.setValue(self.price?.dictionaryRepresentation(), forKey: "price")
		dictionary.setValue(self.description, forKey: "description")
		dictionary.setValue(self.location, forKey: "location")
		dictionary.setValue(self.id, forKey: "id")
		dictionary.setValue(self.type, forKey: "type")
		dictionary.setValue(self.tracking?.dictionaryRepresentation(), forKey: "tracking")
		dictionary.setValue(self.actions?.dictionaryRepresentation(), forKey: "actions")
		dictionary.setValue(self.version, forKey: "version")

		return dictionary
	}

}
