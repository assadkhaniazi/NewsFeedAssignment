#NY Times Most Popular Articles App

This app fetches and displays the most popular articles from the NY Times. Users can view a list of articles and tap on an article to see its details. The app uses the NY Times Most Popular Articles API and provides offline storage capabilities.

#Features

Fetches and displays the most popular articles from the NY Times.
Detailed view for each article.
Offline storage: Articles are available even without an internet connection.
MVVM architecture.
Unit tests and code coverage.

#Requirements

iOS 13.0+
Xcode 12.0+
CocoaPods
Setup and Installation

#Clone the repository:


git clone https://github.com/assadkhaniazi/NewsFeedAssignment.git
cd NewsFeedAssignment
Install dependencies using CocoaPods:


pod install

Open the project in Xcode:


open NewsFeedAssignment.xcworkspace
Running the App

Build and run the app:
Select the Staging target.
Choose a simulator or a connected device.
Press Cmd+R or click the Run button in Xcode.

#Running Unit Tests


Run the tests:

Press Cmd+U 

#Alternatively, you can run tests from the command line:


xcodebuild test -scheme NYTimesPopularArticlesTests -destination 'platform=iOS Simulator,name=iPhone 12,OS=14.5'
Generating Code Coverage Reports

To generate code coverage reports, ensure that code coverage is enabled:

Enable code coverage:


Check the Gather coverage data option.
Run the tests to generate coverage data:

Press Cmd+U View the coverage report:

After tests run, open the Report Navigator (Cmd+8).
Select the latest test report, then click the Coverage tab.
Project Structure

Model: Contains the data models (e.g., Article, ArticleDetails).
View: Contains the UI components (e.g., NewsFeedListViewController, NewsFeedDetailViewController).
ViewModel: Contains the logic to manage and transform data for the views (e.g., NewsFeedListViewModel).
Network: Contains the networking code (e.g., APIService, NetworkUtils).
Database: Contains offline storage handling (e.g., DatabaseManager).
Dependencies

Alamofire: For network requests.
Realm: For offline storage.
SwiftyJSON: For JSON parsing.
Offline Storage

The app uses Realm to cache articles locally. When the app is launched, it fetches articles from the API if an internet connection is available. If not, it falls back to the cached data.

MVVM Architecture

The app follows the MVVM (Model-View-ViewModel) architecture, which promotes separation of concerns and makes the code more testable and maintainable.

Good Practices

Object-oriented programming.
Clear separation of concerns.
Use of protocols for better testability.
#Author

Assad Khan Niazi
Feel free to clone the repository and explore the code. If you have any questions or suggestions, please open an issue or submit a pull request.

#you can mail on : contact.assadkhanniazi@gmail.com

