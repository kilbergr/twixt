# twixt

##Minimum features:
- Shared / group todo lists
- Todo list, sortable by dragging. Drag list items from one list to  another.
- Delayed text and mail messaging integrated on to each list item. 
- Add list list items to google calendar
- Upload images, or link images from other social media accounts, to be displayed in the list
- oAuth / Omniauth for google, facebook.

##APIs to use:
- Twilio
- 2FA
- oAuth/Omniauth
- Google calendar
- EasyUpload


##Stretch goals (not in order):
- Shopping list / expense tracker and calculator
- Venmo integration
- Google maps integration (integrate a mini map in a list item, with directions)



##Models:
####User

* email (req)
* username (req)
* password (req)
* password_digest (req)
* first_name 
* last_name
* birthday
* phone #
* group_id
####Group
* name
* lists_id
* users_id
    
##Abilities (for users and groups)
####List
* name
* items_id
####Item
* name
* is_done?
* date/time created
* image_url
* priority_level
