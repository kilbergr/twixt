# do we want to use destroy_all for our data every time we re-seed?
User.destroy_all
Group.destroy_all
List.destroy_all
Item.destroy_all

# create 5 users
user1 = User.create(username: "CarrotLover", password: "easy", first_name: "Bugs", last_name: "Bunny", email: "babs@example.com", birthday: DateTime.new(1950, 8, 8), phone: "1234567891", avatar: "http://static.dnaindia.com/sites/default/files/2015/07/27/359539-clip-art-bugs-bunny-397350.jpg")
user2 = User.create(username: "Minion478", password: "1234", first_name: "Ronals", last_name: "Minion", email: "follower@example.com", birthday: DateTime.new(1960, 1, 5), phone: "1234567891", avatar: "https://yt3.ggpht.com/-VCWP-meZvJM/AAAAAAAAAAI/AAAAAAAAAAA/85TkyvuWYQU/s900-c-k-no/photo.jpg")
user3 = User.create(username: "YellowBird", password: "birdseed", first_name: "Big", last_name: "Bird", email: "bbird@sesame.com", birthday: DateTime.new(1970, 4, 20), phone: "1234567891", avatar: "http://www.themillions.com/wp-content/uploads/2012/10/570_big-bird-wins.jpg")
user4 = User.create(username: "CatHat", password: "cats", first_name: "Cat", last_name: "InTheHat", email: "cat@thehat.com", birthday: DateTime.new(1900, 2, 3), phone: "1234567891", avatar: "https://www.mercy.net/sites/default/files/files/5819.jpg")
user5 = User.create(username: "JusticeRuth", password: "fairness", first_name: "Ruth", last_name: "Bader Ginsberg", email: "ruth@example.com", birthday: DateTime.new(1930, 5, 6), phone: "1234567891", avatar: "http://p.fod4.com/p/media/abd3f37c27/GVWZaJC6QCOahCnU3OSg_Ruth%20Bader%20Ginsburg%201.jpg")
user6 = User.create(username: "dom", password: "dom", first_name: "dom", last_name: "dom", email: "415.dominic.smith@gmail.com", birthday: DateTime.new(1983, 8, 31), phone: "4156526312", avatar: "http://p.fod4.com/p/media/abd3f37c27/GVWZaJC6QCOahCnU3OSg_Ruth%20Bader%20Ginsburg%201.jpg")
# create 5 groups
group1 = Group.create(name: "Furry Friends")
group2 = Group.create(name: "Rule Followers")
group3 = Group.create(name: "Mellow Yellow")
group4 = Group.create(name: "Only One")
group5 = Group.create(name: "Single Gift Giver")

# add users to groups
group1.users << user1
group1.users << user3
group1.users << user4
group1.users << user6

group2.users << user2
group2.users << user5
group2.users << user3

group3.users << user2
group3.users << user3
group3.users << user6

group4.users << user1

group5.users << user5

# create 10 lists
list1 = List.create(name: "groceries")
list2 = List.create(name: "cinco de mayo")
list3 = List.create(name: "graduation party")
list4 = List.create(name: "baby shower")
list5 = List.create(name: "mardi gras")
list6 = List.create(name: "household items")
list7 = List.create(name: "camping")
list8 = List.create(name: "thank you")
list9 = List.create(name: "school supplies")
list10 = List.create(name: "gifts")

# add lists to groups
group1.lists << list1
group1.lists << list2
group2.lists << list3
group2.lists << list4
group3.lists << list5
group3.lists << list6
group4.lists << list7
group4.lists << list8
group5.lists << list9
group5.lists << list10

# create 27 list items
item1 = Item.create(name: "carrots")
item2 = Item.create(name: "orange juice")
item3 = Item.create(name: "pinata")
item4 = Item.create(name: "margarita mix")
item5 = Item.create(name: "cake with writing")
item6 = Item.create(name: "balloons with 'congrats grad'")
item7 = Item.create(name: "diapers")
item8 = Item.create(name: "baby blankets")
item9 = Item.create(name: "baby clothes")
item10 = Item.create(name: "window cleaner")
item11 = Item.create(name: "sponges")
item12 = Item.create(name: "toilet paper")
item13 = Item.create(name: "matches")
item14 = Item.create(name: "sleeping bag")
item15 = Item.create(name: "tent")
item16 = Item.create(name: "thank you cards")
item17 = Item.create(name: "envelopes")
item18 = Item.create(name: "stickers")
item19 = Item.create(name: "Number 2 pencils")
item20 = Item.create(name: "erasers")
item21 = Item.create(name: "spiral notebook")
item22 = Item.create(name: "chocolate")
item23 = Item.create(name: "dark chocolate")
item24 = Item.create(name: "chocolate with caramel")
item25 = Item.create(name: "chocolate with sea salt")
item26 = Item.create(name: "fluer de lis")
item27 = Item.create(name: "masks")

# add items to lists
list1.items << item1
list1.items << item2

list2.items << item3
list2.items << item4

list3.items << item5
list3.items << item6

list4.items << item7
list4.items << item8
list4.items << item9

list5.items << item26
list5.items << item27

list6.items << item10
list6.items << item11
list6.items << item12

list7.items << item13
list7.items << item14
list7.items << item15

list8.items << item16
list8.items << item17
list8.items << item18

list9.items << item19
list9.items << item20
list9.items << item21

list10.items << item22
list10.items << item23
list10.items << item24
list10.items << item25




