App Name: Bear Planner

App Tagline: Course recommendations and plannner 

Backend Github Repo: https://github.com/abdullah248/courserecommender-backend

Short Description: Bear Planner is designed to help Cornell students struggling to decide what courses to take in upcoming semesters. Currently, Bear Planner allows CS students to input a list of their classes taken and CS interests and outputs a list of suggested classes that matches these interests. We intended to allow users to post reviews for different classes and professors, rate each one, and suggest classes that accounted for missing major/college requirements. Unfortunately, we had issues deploying the backend portion, so the app can only make suggestions based on interests. However, all the endpoints for the class and professor reviews are set up along with the database so if we were able to deploy everything would be fully functional. This idea can be easily scaled up in the future to allow for a variety of different majors from different colleges.

iOS Requirements:


Backend Requirements: 
Our app addresses the backend requirements in the following ways: We used the provided flask boiler plate
to create the models, daos, and controllers. We created a model for each table we wanted, a dao for each table, and a controller for each end point. We used a mySql database locally and tested extensively to make sure all of our end points were working. In our database we had three tables which stored class reviews, professor reviews, and major requirments. We also used the codi api to get class roster information.

Currently we have fully functional (but not deployed) endpoints that do the following actions: 

Class Reviews:
1. Add Class Reviews
2. Get Class Reviews

Professor reviews:
1. Get Professor Reviews
2. Add Professor Reviews

Requirements:
1. Get All the requirements for a major
2. Add new requirements for a major

Get Classes:
1. This end point takes a list of all the classes that the student has taken at Cornell, and their major and then returns a list of the requirements that they have fulfilled, requirements that they need to fulfill, and the list of classes that they can use to fulfill those requirements. To do this we used our requirements table and also made api calls to the codi database to get class informationn.

All of the end points worked locally, however we were unable to deploy properly.


Anything else: We managed to complete a working backend, but we ran into a lot of issues deploying to the Google Cloud. As a result, the iOS app was unable to make use of our API and could only use the CODI API for course listings. The endpoints for the reviews, course listings, and everything else were created and worked on the local machine, but we could not transfer the API to the iOS portion. 


