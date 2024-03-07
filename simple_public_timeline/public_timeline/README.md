# README

## Setup
Follow these steps to set up the server and the application on your local machine.

### Setting up the Server
1. Open a terminal window 
2. cd fake_twitter_api
3. bundle install
4. ruby main.rb -p 3000
5. Accessing localhost:3000 will display the API data

### Setting up the Application
1. Open another terminal window 
2. cd simple_public_timeline/public_timeline
3. bundle install
4. rails s -p 4537
- localhost:4537/ displays the rails route with API data.
- localhost:4537/via_js displays the JavaScript route with API data.

## Thought Process Behind Setting Up the Developer Exercise
- Choosing Rails over Sinatra
    Sinatra might have been the more appropriate choice for this specific exercise due to its smaller and lighter framework. However, I opted for Rails, as it is the framework that companies predominantly utilize in a professional development environment.

- Getting Started
    I began by cloning the fake_twitter_api repository and used Postman to interact with the API, allowing me to access and view the data. 

- Implementing the Facade Design Pattern
    After confirming the API connection through Postman, I proceeded to establish the API connection in the application using the Facade design pattern. The service object takes charge of connecting to the URL and parsing the returned hash data. The facade object invokes the service and maps the data to the plain old Ruby object (PORO).

- Choosing PORO over Model Creation
    I chose to use PORO because we are not persisting the data that flows through the application; we are simply filtering it for display purposes. This approach conserves time, as well as memory and computing resources.

- Developing the Twitter Timeline View Page
    With the groundwork in place, I tackled the creation of the Twitter timeline page, guided by the provided wireframe.

- Addressing CSS Proficiency
    While I acknowledge that my CSS skills are not the strongest, but in the words of Forrest Chang, "that's why we have a frontend engineer", right? All jokes aside, I believe my efforts have roughly captured the essence of the Twitter homepage's appearance, although there's certainly room for improvement in this area. 

- Implementing Tests
    I have written tests for facades, POROs, services, and the timeline view to ensure that our results align with expectations and that the application functions as intended.

## Implementation of JS API call
- Overcoming CORS Error
    One of the significant hurdles encountered was bypassing the CORS policy that led to a 403 FORBIDDEN error. Initially, client-side requests to the fake_twitter_api were blocked due to the same-origin policy enforced by browsers for security reasons. To resolve this, I modified the server-side Sinatra configuration (`fake_twitter_api/main.rb`) to include proper CORS headers. I set the `Access-Control-Allow-Origin` header to allow requests specifically from the client's origin running on port 4537, while the fake_twitter_api server ran on port 3000. After updating the server's CORS settings, the client application hosted at `http://127.0.0.1:4537/via_js` was able to receive responses successfully. I confirmed the results by inspecting the elements and console in the browser's developer tools to make sure the fetched data was as expected.

    The JavaScript code that handled the API call was made within the `via_js.js` file. I used a `<script>` tag within the `views/tweets/via_js.html.erb` template to include this JavaScript file. This setup allowed the posts to be fetched and loaded asynchronously after the initial page load. This method contributes to a better user experience by not blocking the rendering of the rest of the page while the data is retrieved.

## Additional Comments
- Webmock & VCR 
    Employing Webmock & VCR may seem excessive for the scale of this application. Nevertheless, these tools were utilized to cache and store fixture data. This strategy avoids redundant API calls to our backend and speeds up the process of data retrieval during development.

- Placeholder Routes
    The login_path and register_user_path are placeholders. They don't lead to actual functionalities but are included to ensure that the 'Login' and 'Join Twitter' links are visible on the interface. These routes symbolize potential features that could be developed in the future.