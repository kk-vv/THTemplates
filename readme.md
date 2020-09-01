### `THNavigator`

>Use [Sourcery](https://github.com/krzysztofzablocki/Sourcery) and [URLNavigator](https://github.com/devxoul/URLNavigator) to generate inner router to navigator viewcontrollers

- likes: myApp://xxx.com/user_info?user_name=xxx&tel=123456789


####  `Routable`

- Annotation UIViewController and parameter

```
/// sourcery: router="singleParam", name = "Single Param Test Page"
class SingleParamViewController: Routable {

    /// sourcery: parameter
    var navTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = navTitle
    }

}

```

- `Load`

```
Call THNavigator.shared.load()  after finish launching
```

- after build, we can use THNavigator.navigator to show page


```
THNavigator.navigator.push(.singleParam(navTitle: "Single param test"))

```

- Router string is  SnakeCase style

```
At this example, you can type 

oneclass://oneclass.com/single_param?nav_title=AAA 

in Safari APP to wake up this page

```

|Safari|
|----|
|![](https://github.com/iFallen/THTemplates/raw/master/images/safariwakeup.png)|


##### `TIPS`

- Your can add annotation code to code snippets

|Auto Output|
|----|
|![](https://github.com/iFallen/THTemplates/raw/master/images/snippets.png)|

- then ,you can use your own shortcuts like this

|MINE|
|----|
|![](https://github.com/iFallen/THTemplates/raw/master/images/shortcuts.png)|


##### `Annotation multi parameters`

```
/// sourcery:begin: parameter
var codableModel: CodableModel?
var handyjsonModel: HandyJSONModel?
var mapperModel: ObjectMapperModel?
/// sourcery:end
```


### AutoBuildParameters

> **Build parameters for Moya API**

```
enum LoginAPI: AutoBuildParameters {
    case login(userName: String, password: String?)
    case logout
    
    var moyaParameters: [String: Any] {
        return parameters
    }
}
```

- `after build`

|Auto Output|
|----|
|![](https://github.com/iFallen/THTemplates/raw/master/images/parameters.png)|


### `AutoEquatable`

```
struct EquatableModel: Codable, AutoEquatable {
    var uuid: String
    var name: String
    var tel: String
    var sex: UInt?
    var address: String?
}
```

- `after build`

|Auto Output|
|----|
|![](https://github.com/iFallen/THTemplates/raw/master/images/equatable.png)|

### `About config`

|config|
|----|
|![](https://github.com/iFallen/THTemplates/raw/master/images/config.png)|

- config file under the projects folder, is a hidden file

|config|
|----|
|![](https://github.com/iFallen/THTemplates/raw/master/images/sourcery.yaml.png)|

#### `MORE`

- You can write your own templates use [Stencil](https://github.com/stencilproject/Stencil)