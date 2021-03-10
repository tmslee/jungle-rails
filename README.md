# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

!["Jungle App"](https://github.com/tmslee/jungle-rails/blob/master/docs/home.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* Sass-rails
* Uglifier
* Jquery-rails
* Turbolinks
* Jbuilder
* Sdoc
* Bcrypt
* Puma
* Font-awesome-rails
* Bootstrap-sass
* Money-rails
* Rmagick

# Features

## User Authentication
- new users can sign up through the sign up page. once sign up is validated they will be automatically logged in and redirected to the home page
!["sign up page"](https://github.com/tmslee/jungle-rails/blob/master/docs/signup.png)
- existing users can log in through the log in page 
!["log in page"](https://github.com/tmslee/jungle-rails/blob/master/docs/login.png)

- nav bar will display appropriate user authentication options as follows:
- visitors (not logged in) will be shown sign up and login buttons 
!["home logged out"](https://github.com/tmslee/jungle-rails/blob/master/docs/home.png)
- logged in users will be shown signed in as: <username> and a log out button
!["home logged in"](https://github.com/tmslee/jungle-rails/blob/master/docs/logged_in_home.png)

## About Us
- About Us from nav bar will link to the about us page displaying a short description of the app
!["about us page"](https://github.com/tmslee/jungle-rails/blob/master/docs/about_us.png)

## Products
- main page (home) displays a list of products
!["product list"](https://github.com/tmslee/jungle-rails/blob/master/docs/home.png)
- details of the product can be seen by clicking on the details button which will redirect 
users to the product details page
!["product details"](https://github.com/tmslee/jungle-rails/blob/master/docs/product_details.png)
- sold out products will have an indicator attached to them 
- products can be added to cart by clicking the add to cart button

## Categories
- nav bar has a drop down category menu which allows users to select a category
!["category menu"](https://github.com/tmslee/jungle-rails/blob/master/docs/category_menu.png)
- doing so will display a list of products (like the home page)
!["product by category"](https://github.com/tmslee/jungle-rails/blob/master/docs/products_category.png)

## Cart
- an empty cart will display a message saying that it is empty with a link to the product list page
!["empty cart"](https://github.com/tmslee/jungle-rails/blob/master/docs/empty_cart.png)
- a non empty cart will display all items in cart, sub totals by item and the total of the cart
!["non empty cart"](https://github.com/tmslee/jungle-rails/blob/master/docs/cart_with_items.png)
- clicking pay with card button will proceed the user with payment and order process

## Order
- clicking pay with card button will display the following form for payment
!["payment form"](https://github.com/tmslee/jungle-rails/blob/master/docs/payment.png)
- clicking the pay button with correct information will display a successful order summary page
!["order summary"](https://github.com/tmslee/jungle-rails/blob/master/docs/order_summary.png)
- after a successful order, the cart will be emptied and users can choose to press continue shopping and be redirected to the products list (home page)

## Admin
- with proper admin credentials, a user can access the admin menus from the nav bar
!["admin menu"](https://github.com/tmslee/jungle-rails/blob/master/docs/admin_menu.png)
!["admin credentials prompt"](https://github.com/tmslee/jungle-rails/blob/master/docs/admin_auth.png)
- correct name and password is "Jungle" and "book", respectively.

### Admin Dashboard
- the dashboard displays relevant data about the application: number of products and the number of categories and a redirect link to the product index.
!["admin dashboard"](https://github.com/tmslee/jungle-rails/blob/master/docs/admin_dashboard.png)

### Admin Products
- products will display a list of existing proucts with the option of adding and deleting them
!["admin product list"](https://github.com/tmslee/jungle-rails/blob/master/docs/admin_products.png)
- clicking the new product button will allow the admin to add a new product
!["admin add product"](https://github.com/tmslee/jungle-rails/blob/master/docs/admin_add_product.png)
- not filling out the form correctly will display appropriate errors
!["admin add product errors"](https://github.com/tmslee/jungle-rails/blob/master/docs/admin_add_product_err.png)
- clicking the delete button will prompt the admin if they wish to follow through with their actions
!["admin delete product"](https://github.com/tmslee/jungle-rails/blob/master/docs/admin_delete_product.png)

### Admin Categries
- categories will display a list of existing categories
!["admin category list"](https://github.com/tmslee/jungle-rails/blob/master/docs/admin_categories.png)
- admin can add a new category
!["admin add category"](https://github.com/tmslee/jungle-rails/blob/master/docs/admin_add_category.png)
