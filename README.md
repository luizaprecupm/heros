#  Marvel

This is a test application that reads the data provided by the Marvel API `http://gateway.marvel.com`

## Usage

The user can see an infinite list of marvel characters, can get details on each character and also can search for characters by name.

## Installation
This project's only dependency is the SDWebImage SwiftPM package.

## Requirements
- Swift 5.5
- iOS 15+

##   Design Pattern Used  — XCUITest with Page Object Model (POM)

**Screen Class:**
The basic concept is that each screen will have a corresponding screen class containing XCUIElements specific for that screen. This means that in case our  view’s elements locators change, we’ll have to do minimal work by changing variables only here. 

**Action Class**
 The Action Class will have an instance of the screen class which will allow us to interact with the XCUIElements and perfom any actions on them: like tap(), XCTAssertTrue etc
 Each of the public methods of your Screen Object should return something - either self, other screen object or data, so we could chain them in our UI Tests.

**UI Test Class**
Here we are using all the defined Actions and chain them in such a way that we will perform an end to end test

**Contracts**
 By using protocols, we created reusable components. Different types can conform to the same protocol, allowing us to write generic code that works with any conforming type. While Swift doesn’t support multiple inheritance for classes, a class can conform to multiple protocols. This allows us to gain functionality from multiple sources.
 The framework also has protocols with default implementations using extensions, allowing you to define shared behavior while still allowing individual types to customize specific aspects.

**Extensions**
We make use of the extensions as well Extensions as they allow us to add new functionality to existing classes, structures, enumerations, or protocols without modifying their original implementation. 


## Running the UI Tests

- Start Xcode
- Open the project
- From the Schema chose MarvelUIPOMTests and select a simulator where you want to run the tests
  <img width="1423" alt="Screenshot 2024-07-16 at 12 29 23 PM" src="https://github.com/user-attachments/assets/2df714a7-9f3e-4339-95cd-a811ce8aa2ae">
- From the project navigator go to MarvelUIPOMTests/ MarvelTests and chose one of the swift files MarvelHomeScreenTests, SearchViewTests or HeroDetailsViewTests
- In front of each class there's a play button triggering the whole tests or a play button in from of each test to run them one by one
  
