#Devise setup

1. Require devise in your Gemfile `gem devise` & bundle install
2. `rails g devise:install`
3. Follow the instructions that that command outputs for you.
4. Generate a devise enabled model: `rails g devise User`
5. Edit that migration to add any additional fields you want on your user
6. Generate devise views so they're customizable in your own app structure `rails g devise:views`

#To add Omniauth provider login

1. Find associated gem, and add to Gemfile, e.g. `omniauth-github`
2. `bundle install`
3. In your devise enabled model (i.e. User), add the `:omniauthable` module and specify the provider you will use as `omniauth_providers: [:github]`
4. Edit your routes `devise_for` like so: https://github.com/jraines/devise-demo/blob/master/config/routes.rb#L2
5. Register your application with the provider and get an App key and App secret -- store these in environment variables
6. Check `rake routes` for the route you should set as your application's callback URL at the provider's website, e.g. `localhost:3000/auth/github/callbacks`.  This will be handled by the controller you specify in step 4) above
7. Edit devise initializer to set up that provider like so: https://github.com/jraines/devise-demo/blob/master/config/initializers/devise.rb#L241
8. Add a link on your signin page to test out the auth flow, like so: https://github.com/jraines/devise-demo/blob/master/app/views/devise/sessions/new.html.erb#L2
9. Click the link and make sure it sends you to the provider for authorization, and back to your app afterwards.  To verify this last step, you can inspect the `request.env['omniauth.auth']` object in the callback you defined: https://github.com/jraines/devise-demo/blob/master/app/controllers/omniauth_callbacks_controller.rb#L2
10. Whitelist the params you'll need to login or create the user: https://github.com/jraines/devise-demo/blob/master/app/controllers/omniauth_callbacks_controller.rb#L12
11. Pass those into a method which will find or create the user: https://github.com/jraines/devise-demo/blob/master/app/controllers/omniauth_callbacks_controller.rb#L3
12. Implement that method to your app's requirements: https://github.com/jraines/devise-demo/blob/master/app/models/user.rb#L8
13. Once you have that working, and a user is found or created, sign the user in with `sign_in` and then redirect somewhere: https://github.com/jraines/devise-demo/blob/master/app/controllers/omniauth_callbacks_controller.rb#L6

