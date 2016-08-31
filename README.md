# Clothing shop
A light-weight one-page Rails app for a clothing shop, in its first iteration. 
You can see the user stories [here](https://github.com/andreamazza89/e-shop/blob/master/docs/user_stories.md)

### Snapshot
![snapshot](https://github.com/andreamazza89/e-shop/blob/master/docs/Screen%20Shot%202016-08-31%20at%2010.21.35.png)

### Installation
- Install Ruby language version 2.3.0 (Recommended version manager: [rvm](https://rvm.io/rvm/install)).
- Install [bundler](http://bundler.io/).
- Install [SQlite3](https://www.sqlite.org/).
- Install Firefox [47.0.1] (https://support.mozilla.org/en-US/kb/install-older-version-of-firefox).
- Clone this repo and move into it ```git clone https://github.com/andreamazza89/e-shop && cd e-shop```
- Run bundle to install all dependencies ```bundle```
- Run the test suite to check everything is OK ```rspec```
- Create ```bin/rake db:create```, migrate to ```bin/rake db:migrate``` and seed ```bin/rake db:seed``` the database.
- Start the server ```bin/rails s```
- Visit ```localhost:3000``` to purchase some fine garments.

### Rationale
The major challenge I found has been to not over-optimise nor make any decisions 
for the client. It is very tempting to add features that seem obvious and were 
not asked in the brief, however doing so has a strong likelihood of wasting time 
if either it turns out the feature was unnecessary or not in line with future 
client requirements.  
For instance, it would seem reasonable to display the products ordered and 
divided by gender/category; this is however not specified anywhere in the brief 
and the decision is best left with the Client at the end of the first iteration.

##### Technologies
The app is built in Ruby using RubyOnRails. It makes use of Rails' unobtrusive 
Javascript, allowing for dynamic content udpate.

##### Products 
These are persisted in one ```products``` table and displayed in the view as an 
HTML table. At this stage the stock quantity is not updated when a user adds a 
product to the cart. In other words, the current iteration does not take into 
account multiple instances of the same product in the cart: the same product can 
be added unlimited times as long as the stock count is greater than 0.

##### Cart and Cartitems
When a customer first connects, a cart is created and a reference to this is 
stored in the session. As the customer selects products, cartitems are created. 
These are both associated to a product and the customer's cart. The current 
iteration does not manage the end of the session. It is likely the session will 
update the stock quantity of the products once these are added to the cart and 
have a timeout to close the session, upon which the cart/cartitems are destroyed 
and the stock count on the products updated.

##### Vouchers
There are three vouchers to apply, as per the brief, described below:  
FIVE OFF - £5 discount, no matter what.  
TEN OFF - £10 discount, applicable if the total in the cart is greater than £50.  
FIFTEEN OFF -£15 discount, applicable if the total in the cart is greater than £75 and ar least one footwear item is in the cart

These are not persisted in the current iteration. When a session is first 
established with a client, a ```discount``` key with a value of 0 is added to 
the session hash. This is subtracted when calculating the cart total. The 
discount is validated and updated via the Voucher model when a user enters the 
code. Notice that the current design is not optimal, especially because adding a 
new voucher would mean modifying the Voucher class and adding more branches of a 
case statement. Also, having the discount stored in the session requires this to 
be passed around to the Model layer. As the scope of this area (vouchers) becomes 
clearer iteration after iteration, the application can be optimised.

Finally, a note on prices. These are stored as an integer amount of pennies.
