# Number Recycling API User Story


| **Item** | **Details** |
| ---- | ------- |
| ***Summary*** | As an enterprise application developer, I want to check whether there has been a change in the user associated with the phone number after the specified date so that I can ensure that a phone number is correctly linked to an user and prevent mis-delivery before sending SMS messages to an user.  |
| ***Roles, Actors and Scope*** | **Actors:**  Application service providers (ASP), ASP:User, ASP: BusinessManager, ASP:Administrator, Communication service Provider (CSP), Channel Partner. <br>**Scope:** Checks whether there has been a change in the user associated with the specific phone number after the specified date. |
| ***Pre-conditions*** |The preconditions are listed below:<br><ol><li> The ASP:BusinessManager and ASP:Administrator have been onboarded to the CSP's API platform optionally through a Channel Partner.</li><li> The ASP:BusinessManager has successfully subscribed to the Number Recycling API product from the product catalog optionally through a Channel Partner.</li><li> The ASP:Administrator has onboarded the ASP:User to the platform.|
| ***Activities/Steps*** | **Starts when:** The ASP application makes a POST request to the Number Recycling API, including specified date and the phone number provided by the user in the ASP:User. This request could be done via (or not) the Channel Partner.<br>**Ends when:** The CSP's Number Recycling Server responds to confirm if the user associated with the phone number has changed since the specified date. |
| ***Post-conditions*** | The ASP:User could continue offering to send the SMS messages to the user associated with the phone number.  |
| ***Exceptions*** | Several exceptions might occur during the Number Recycling API operations.<br>- Unauthorized: Not valid credentials (e.g., use of already expired access token).<br>- Invalid input: Not valid input data to invoke operation (e.g., improperly formatted phone number).|
