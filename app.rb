require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
require('pry')
require('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "volunteer_tracker"})

get ('/') do
  redirect '/projects'
end

get ('/projects') do
  @projects = Project.all
  @volunteers = Volunteer.all
  erb :projects
end

post('/projects/search') do
  search_input = params[:search]
  @results = Project.search(search_input)
  erb :search_results
end

get ('/projects/new') do
  erb :new_project
end

post ('/projects') do
  title = params[:title]
  project = Project.new({:title => title, :id => nil})
  project.save
  redirect '/projects'
end

get ('/volunteers/:id') do
  @volunteer = Volunteer.find(params[:id].to_i)
  erb :volunteer
end

get ('/projects/:id') do
  @volunteers = Volunteer.all_unassigned
  @project = Project.find(params[:id].to_i)
  erb :project
end
#
get ('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i)
  erb :edit_project
end

patch ('/projects/:id') do
  @project = Project.find(params[:id].to_i)
  @project.update(params[:title])
  redirect '/projects'
end

delete ('/projects/:id') do
  @project = Project.find(params[:id].to_i)
  @project.delete
  redirect '/projects'
end

get ('/projects/:id/volunteers/:volunteer_id') do
  @volunteer = Volunteer.find(params[:volunteer_id].to_i)
  erb(:volunteer)
end

post ('/projects/:id/volunteers') do
  @project = Project.find(params[:id].to_i)
  volunteer = Volunteer.find(params[:volunteer].to_i)
  volunteer.update(volunteer.name, @project.id)
  @volunteers = Volunteer.all_unassigned
  erb :project
end

post ('/projects/:id/volunteers/:volunteer/remove') do
  @project = Project.find(params[:id].to_i)
  volunteer = Volunteer.find(params[:volunteer].to_i)
  volunteer.reset_project
  @volunteers = Volunteer.all_unassigned
  erb :project
end

post ('/projects/volunteers/new') do
  volunteer = Volunteer.new({:name => params[:volunteer_name], :project_id => 0, :id => nil})
  volunteer.save
  redirect '/projects'
end

patch ('/volunteers/:volunteer_id') do
  volunteer = Volunteer.find(params[:volunteer_id].to_i)
  volunteer.update(params[:name], volunteer.project_id)
  redirect '/projects'
end

delete ('/volunteers/:volunteer_id') do
  volunteer = Volunteer.find(params[:volunteer_id].to_i)
  volunteer.delete
  redirect '/projects'
end
