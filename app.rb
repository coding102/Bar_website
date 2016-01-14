#create "Gemfile" file, add "gem 'sinatra'", and run bundle install
require 'sinatra'
require 'sendgrid-ruby'


# home direction
get '/' do
    erb :home
end

#menu direction
get '/menu' do
    erb :menu
end

#events direction
get '/events' do
    erb :events
end

#bar direction
get '/bar' do
    erb :bar
end

#contact direction
get '/contact' do
    erb :contact 
end


#posting to email form in contact.erb 
post '/email-request' do

    
    @firstname = params['first']
	   @lastname = params['last']
	   @email = params['email']
	   @phone = params['phone']
	   @description = params['description']
    
    #sendgrid client validation
    client = SendGrid::Client.new do |c|
        c.api_key = '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'
    end
    
    #routing html form to post request
    mail = SendGrid::Mail.new do |m|
        m.to = 'mercercountynj@gmail.com'
        m.from = @email
        m.subject = 'Hello world!'
        m.text = @description
    end

    puts "CONTACTING"
    puts "*****************************"
    res = client.send(mail)
    puts res.code
    puts res.body
    
    erb :home
    
end

get '/dining' do
    erb :dining
end







configure(:development){set :database, "sqlite3:blog.sqlite3"}