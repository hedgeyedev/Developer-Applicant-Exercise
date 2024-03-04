# README

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

## Additional Comments
- Webmock & VCR 
    Employing Webmock & VCR may seem excessive for the scale of this application. Nevertheless, these tools were utilized to cache and store fixture data. This strategy avoids redundant API calls to our backend and speeds up the process of data retrieval during development.

- Placeholder Routes
    The login_path and register_user_path are placeholders. They don't lead to actual functionalities but are included to ensure that the 'Login' and 'Join Twitter' links are visible on the interface. These routes symbolize potential features that could be developed in the future.