# Chicken Lister Project

Welcome to Chicken Lister, a fun and quirky Craigslist-inspired web application with a chicken twist! This project aims to replicate the core features of Craigslist while adding a chicken-themed experience for users to enjoy.

## Features
- **User Registration:** Users can create accounts to access additional features and create their own chicken-related ads.
- **User Login:** Registered users can log in to manage their ads and profile.
- **Intended Redirecting:** After successful actions (e.g., login, registration), users are directed back to their intended page for a smooth experience.
- **Sticky Form:** If a form submission fails due to validation errors, the user's input is retained in the form to prevent data loss.
- **Creating Ads:** Logged-in users can create new ads with chicken-related titles and descriptions.
- **Detail Page for Each Ad:** Every ad has its own detail page where users can view its title, description, and other relevant information.
- **Updating Ads:** Logged-in users can modify the details of their ads, such as the title or description.
- **Deleting Ads:** Users can delete their own ads from the platform.
- **Updating Profile:** Registered users can update their profile information, including their username and password.
- **Searching and Sorting:** Users can search for chicken-related ads and sort the search results based on various criteria.
- **Dynamic Nav Bar:** The navigation bar adapts based on the user's authentication status, providing different options for logged-in and non-logged-in users.
- **Data Validation:** All user input undergoes rigorous validation to ensure it meets required criteria before being stored in the database, enhancing data integrity and security.
- **Error Handling:** Users receive informative error messages when they encounter any issues or provide invalid input.

## Learning Objectives
By working on Chicken Lister, you will gain valuable skills and knowledge, including:
- Using Java to generate HTML pages dynamically.
- Interacting with a MySQL database using Java.
- Understanding the Model-View-Controller (MVC) paradigm for building web applications.
- Navigating the request-response lifecycle of HTTP requests.
- Managing project dependencies with Maven.
- Creating servlets and mapping them to specific URIs.
- Generating HTML pages with JavaServer Pages (JSP) and the JavaServer Pages Standard Tag Library (JSTL).
- Establishing database connections and executing queries with JDBC.
- Utilizing prepared statements to prevent SQL injection.
- Properly handling user passwords for enhanced security.

## Getting Started
1. Clone this repository and open the project in IntelliJ or your preferred Java IDE.
2. Configure the project to use Maven for dependency management and Tomcat as the server container. If you have not done this yet, follow the instructions provided in the project.
3. Work on each feature by switching to the corresponding branch. Always ensure you are working on a clean branch before starting a new feature.

## Project Structure
The project is organized into branches, with each branch corresponding to a specific feature or lesson. Each branch contains the starter code for that feature. Switch to the relevant branch to work on the feature.

## Usage
1. Install the required dependencies using Maven.
2. Run the project on the Tomcat server.
3. Access the application through the browser at http://localhost:8080/.
