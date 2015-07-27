# twixt

##Minimum features:
- Shared / group todo lists
- Todo list, sortable by dragging. Drag list items from one list to  another.
- Delayed text and mail messaging integrated on to each list item. 
- Add list items to google calendar
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
* avatar
* is_admin
* is_owner

####Group
* name

####List
* name (req)
* date

####Item
* name (req)
* complete default false (req)
* date
* priority_level 
* image_url
* list_id

##Associations (for users and groups)
* user:references
* group:references

All models one:many except users:groups.
