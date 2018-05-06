App Name: Bear Planner
App Tagline: Course recommendations and plannner 
Backend Github Repo: https://github.com/abdullah248/courserecommender-backend


iOS Requirments:

Backend Requiremennts: 
Our app addresses the backend requirments in the following ways: We used the provided flask boiler plate
to create the models, daos, and controllers. We created a model for each table we wanted, a dao for each table, and a controller for each end point. We used a mySql database locally and tested extensively to make sure all of our end points were working. In our databse we had three tables which stored class reviews, professor reviews, and major requirments. We also used the codi api to get class roster information.

Currently we have fully functional (but not deployed) endpoints that do the following actions: 

Class Reviews:
1. Add Class Reviews
2. Get Class Reviews

Professor reviews:
1. Get Professor Reviews
2. Add Professor Reviews

Requirements:
1. Get All the Requirments for a major
2. Add new requirments for a major

Get Classes:
1. This end point takes a list of all the classes that the student has taken at Cornell, and their major and then returns a list of the requirments that they have fulfilled, requirements that they need to fulfill, and the list of classes that they can use to fulfill those requiremnts. To do this we used our requirments table and also made api calls to the codi database to get class informationn.

All of the end points worked locally, however we were unable to deploy properly.


