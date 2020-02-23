# catRatingsForGreatGood

## Table of Contents:
- [Swift Files](#swift-files)
  - [AppDelegate](#appdelegate)
  - [Cat](#cat)
  - [CatTableViewCell](#cattableviewcell)
  - [CatTableViewController](#cattableviewcontroller)
  - [CatViewController](#catviewcontroller)
  - [RatingControl](#ratingcontrol)
  - [SceneDelegate](#scenedelegate)
- [Storyboard Files](#storyboard-files)
  - [Main](#main)
- [Life Cycle Methods of UIView Controller](#life-cycle-methods-of-uiview-controller)
  - [viewDidLoad](#viewdidload)
  - [viewWillAppear](#viewwillappear)
  - [viewDidAppear](#viewdidappear)
  - [viewWillDisappear](#viewwilldisappear)
  - [viewDidDisappear](#viewdiddisappear)
- [Glossary](#glossary)
  - [Action](#action)
  - [Control](#control)
  - [Data Model](#data-model)
  - [Delegate](#delegate)
  - [Failable Initializers](#failable-initializers)
  - [First Responder](#first-responder)
  - [Gesture Recognizer](#gesture-recognizer)
  - [Guard](#guard)
  - [IB](#ib)
  - [IBAction](#ibaction)
  - [Initializer](#initializer)
  - [Implicitly Unwrapped Optional](#implicitly-unwrapped-optional)
  - [Optional](#optional)
  - [Outlet](#outlet)
  - [private](#private)
  - [Property Observer](#property-observer)
  - [Protocol](#protocol)
  - [Scene](#scene)
  - [Segue](#segue)
  - [Table View Controller](#table-view-controller)
  - [Table View Data Source](#table-view-data-source)
  - [Table View Data Source Methods](#table-view-data-source-methods)
  - [Table View Delegate](#table-view-delegate)
  - [View Controller](#view-controller)
  - [weak](#weak)
  
  

## Swift Files

### AppDelegate

### Cat
- This file defines the Cat data model.  This defines the properties on the Cat class, includes some guards to ensure that there is a name for the Cat and that the rating for the Cat is between 0 - 5 inclusive.  This also defines the initialization of the Cat.

### CatTableViewCell
- This file defines a custom cell for the CatTableView, defining the design and behavior of each cell.

### CatTableViewController
- This file defines a custom table view controller subclass that manages the cat list scene.  It loads the initial list of cats when the view loads.  Instead of creating new cells and deleting old cells as a user scrolls, the `dequeueReusableCell(withIdentifier:for:)` method ensures that the table tries to reuse cells when possible.  This file also holds the Table View Data Source methods.

### CatViewController
- This file specifies the behavior of the textfield and the image picker on a cat detail view.

### RatingControl
- This file creates the rating buttons displayed by the CatTableViewCell and establishes the appearance and behavior of the rating system.

### SceneDelegate

## Storyboard Files

### Main


## Life Cycle Methods of UIView Controller
These are the five lifecycle methods associated with the UIView Controller, in order

### viewDidLoad
- Called when a view controller's content view is created and loaded from a storyboard.  Outlets are guaranteed to have valid values by the time this method is called.  Use this method for additional setup necessary for the view controller.  Typically called once.

### viewWillAppear
- Called just before a view controller's content view is added to the app's view hierarchy.  Use this method to trigger any operations that need to occur before the content view is presented onscreen.

### viewDidAppear
- Called after a view controller's content view has been added to the app's view hierarchy.  Use this method for triggering any action that needs to occur as soon as the view is presented onscreen - fetching data, showing animation, etc.

### viewWillDisappear
- Called just before a view controller's content view is removed from the app's view hierarchy.  Not called when hidden or obscured, only when about to be removed.  Use for cleanup tasks like committing changes or resigning first responder status.

### viewDidDisappear
- Called after a view controller's content view is removed from the app's view hierarchy.  Use this to perform additional teardown.

## Glossary

### Action
- A piece of code linked to an event that can occur in the app.   You use actions to drive the flow of your app in response to user or system events.

### Control
- Specialized versions of views that respond to user actions in a specific way.  While a view displays content, a control modifies content in some way.

### Data Model
- A data model represents the structure of the information stored in an app.

### Delegate
- Object that acts on behalf of or in coordination with another object.   The delegating object holds a reference to the other object (delegate) and sends a message telling them about an event about to be handled or that has just been handled.  A delegate can then respond to these changes.

### Failable Initializers
- Failable initializers always start with either `init?` or `init!`.  These initializers return optional values or implicitly unwrapped optional values, respectively.
- Failable initializers are hard to use because you need to unwrap the returned optional before using it.  Some developers prefer to enforce an initializer's contract by using `assert()` or `precondition()` methods.  These methods cause the app to terminate if the condition they are testing fails.  This means that calling code must validate the inputs before calling the initializer.

### First Responder
- An object that is first in line for receiving events.  A text field first responder will bring up the keyboard.  You need to implement delegate methods to resign first responder status when the user has hit enter.  (`textFieldShouldReturn(_:)`)

### Gesture Recognizer
- Objects that you attach to a view to respond to the user the way a control does.

### Guard
- Declares a condition that must be true in order for the code after the guard statement to execute.  If the condition is false, the guard statement's else statement must exit the current code block (by calling return, break, continue, throw, or a method that doesn't return - like `fatalError(_:file:line:)`).

### IB
- Interface Builder

### IBAction
- Methods for actions you can connect to from storyboard

### Implicitly Unwrapped Optional
- A type of [optional](#optional) that the system implicitly unwraps

### Initializer
- A method that prepares an instance of a class for use -> setting initial values for each property and performing any other setup.  There are two kinds of init for initializing a view - one for programmatically initializing the view (`init(frame:)`) and one for loading the view from storyboard (`init(coder:)`).

### Optional
- Can etiher contain a valid value or nil

### Outlet
- A way to reference interface objects (storyboard objects) from source code files.  Ctrl + drag from storyboard to view controller file to create a property for the object in your view controller file, letting you access and manipulate that object from code at runtime.

### private
- The private keyword ensures a method can only be called by code within the declaring class, letting you encapsulate and protect methods, ensuring they are not unexpectedly or accidentally being called from the outside.

### Property Observer
- In order to update a control, you need to reset hte control's settings every time the attributes change.  To do that, you need to add a property observer.  A property observer observes and responds to changes in a property's value.  They are called every time a property's value is set and can be used to perform work immediately before or after a value changes.

### Protocol
- Defines a delegate -- gets added in class declaration

### Scene
  - One screen of content and typically one view controller.

### Section
- Visual groupings of cells within table views.  For a simple table view, this may only be one.

### Segue
- Transitions between scenes

### Table View Controller
- A subclass of UIViewController, used for displaying tabular data.  In order to display dynamic data, a table view needs a data source and a delegate.

### Table View Data Source
- A table view data source supplies the table view with data it needs to display

### Table View Data Source Methods
- In order to have a functioning table view, you need to have three table view data source methods:
  - `func numberOfSections(in tableView: UITableView) -> Int`
    * This tells the table view how many sections to display
  - `func tableView(_ tableView: UITableView, numberOfRows(inSection section: Int) -> Int`
    * This tells the table view how many rows to display in a given section.  The number of rows should be the number of elements you are wanting to display.
  - `func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell`
    * Configures and provides a cell to display for a given row.   Each row in a table view has one cell, and that cell determines the content that appears in that row and how that content is laid out.  For table views with a small number of rows, all rows are on screen at once, so this method is called for each row in the table.  For table views with a large number of rows, it can display only a small fraction of their total items at a given time and it's most efficient for a table view to ask for only the cells for rows that are being displayed.  This is what this method allows a table view to do.

### Table View Delegate
- Helps the table view manage cell selection, row height, and other aspects related to displaying the data.

### View Controller
  - Manages a single content view with its hierarchy of subviews.  View Controllers also coordinate the flow of information from the app's data model (which encapsulates the app's data) and the views that display that data, manage lifecycle of content views, handle device orientation changes, define navigation, and implement the behavior to respond to user input.
 
### weak
- You might see property declarations like `weak var nameLabel`.  "weak" helps prevent reference cycles - it does not prevent the system from deallocating the referenced object.  To keep an object alive and in memory, you need to have a strong reference to the object somewhere.  
