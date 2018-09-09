App Name: Bear Planner

App Tagline: Course recommendations and plannner 

Screenshots:

[![loading screen](https://i.imgur.com/YRb51LL.png)]
[![Bubbles1](https://i.imgur.com/lXtSzt7.png)]
[![Bubbles2](https://i.imgur.com/yAwFtWb.png)]
[![lol](https://i.imgur.com/R03uJbh.png)]
[![lol2](https://i.imgur.com/Ph3oH8j.png)]
[![lol3](https://i.imgur.com/ZE6GC3y.png)

Backend Github Repo: https://github.com/abdullah248/courserecommender-backend

Short Description: Bear Planner is designed to help Cornell students struggling to decide what courses to take in upcoming semesters. Currently, Bear Planner allows CS students to input a list of their classes taken and CS interests and outputs a list of suggested classes that matches these interests. We intended to allow users to post reviews for different classes and professors, rate each one, and suggest classes that accounted for missing major/college requirements. Unfortunately, we had issues deploying the backend portion, so the app can only make suggestions based on interests. However, all the endpoints for the class and professor reviews are set up along with the database so if we were able to deploy everything would be fully functional. This idea can be easily scaled up in the future to allow for a variety of different majors from different colleges.

We used autolayout throughout the app to lay out all the labels, buttons, tableviews, and images in relation to each other. There were a few instances where we used a frame-based layout because we were using Cocoapods and the documentation for the Cocoapods had a frame-based layout which was easier for me to translate into my app. 

Tableviews were also used extensively to display information. The first time that we used tableviews was in the main ViewController. When the user pressed add and adds a class, a cell is added to the TableView. We also made some tweaks to the custom cells to add colors in the background, have rounded corners, and also shrink the size of the cells. We also used a tableview to display information after the user searches for classes that are similar to it. 

We had both ModalViewControllers and NavigationViewControllers in the app. The app starts off with a loading screen which fizzles away after 5 seconds and displays a modal view controller which allows the user to select their interests in CS in a fashion similar to the Bubbles found in Apple Music. By pressing the right arrow, the user is then presented another ModalViewController which prompts them to select their interests in areas that are unrelated to CS. Finally, when the user presses the right arrow again, they are then presented a navigation view controller with the rootviewcontroller being the new screen which allows users to see the classes they have added to the application. Pressing Add or Search will push navigation view controllers onto the stack and users can go back and forth between them through the UINavigationBar.

We used the provided flask boiler plate to create the models, daos, and controllers. We created a model for each table we wanted, a dao for each table, and a controller for each end point. We used a mySql database locally and tested extensively to make sure all of our end points were working. In our database we had three tables which stored class reviews, professor reviews, and major requirments. We also used the codi api to get class roster information.

Currently we have fully functional (but not deployed) endpoints that do the following actions: (example requests are in ())

Class Reviews:
1. Add Class Reviews (localhost:5000/api/v0/make_class_review?class_name=cs3110&prof_name=foster&review=amazing&difficulty=3&quality=5)
2. Get Class Reviews (localhost:5000/api/v0/class_reviews?name=cs3110)

Professor reviews:
1. Get Professor Reviews (localhost:5000/api/v0/prof_reviews?name=bob)
2. Add Professor Reviews (localhost:5000/api/v0/make_prof_review?class_name=%22john%22&review=%22horrible%22&difficulty=1&quality=2)

Requirements:
1. Get All the requirements for a major (localhost:5000/api/v0/major_reqs?name=csarts)
2. Add new requirements for a major (localhost:5000/api/v0/add_major_req?name=csArts&distribution_name=STATS&credits=4&req_class=btry3080,cs4850,ece3100,econ3130,engrd2700,math4710)


Get Classes:
1. This end point takes a list of all the classes that the student has taken at Cornell, and their major and then returns a list of the requirements that they have fulfilled, requirements that they need to fulfill, and the list of classes that they can use to fulfill those requirements. To do this we used our requirements table and also made api calls to the codi database to get class information.  (localhost:5000/api/v0/getClasses?major=csarts&classes_taken=cs 2110,cs 3410)

