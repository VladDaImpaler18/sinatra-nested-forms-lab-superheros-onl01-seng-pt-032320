require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :super_hero
    end

    post '/teams' do
        
        @team = Team.new(params[:team])
        params[:team][:members].each{ |member_info| Member.new(member_info)}
        @members = Member.all
        erb :team
    end

end
