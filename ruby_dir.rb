
def if_input_not_entered
abort("you should enter mkruby your_file_name")if ARGV.empty?
end

def name_directory
  return @folder_name = ARGV.join("_")
end

def make_directory_files_install name
  @path = Dir.pwd
  @root_direc = @path + "/" + name
  Dir.mkdir(@root_direc)
  lib = @root_direc + "/" + "/lib"
  Dir.mkdir(lib)
  spec =  @root_direc + "/spec"
  Dir.mkdir(spec)



  #============= FILE ===================

    #================== Gemfile ===============
  gem = File.open("#{@root_direc}/Gemfile", "a")
  gem.puts("ruby '2.5.1'")
  gem.puts("gem 'rspec'")
  gem.puts("gem 'pry'")
  gem.puts("gem 'rubocop'")
  #=================== gitignore ====================
  gitignore = File.open("#{@root_direc}/.gitignore" , "a")
  gitignore.puts(".env")
  #========================= ENV ================
  env = File.open("#{@root_direc}/.env", "a")

  #=================== APP ===================
  app = File.open("#{@root_direc}/app.rb" , "a")
  #=============== SPEC FILE ======================
  spec_file = File.open("#{spec}/spec.rb" , "a")
  spec_file.puts("reqiure_relative '../app.rb'")
  spec_file.puts("Describe '  ' do")
  spec_file.puts("it '  ' do")
  spec_file.puts("expcet()")
  spec_file.puts("end")
  spec_file.puts("end")





        Dir.chdir "#{@folder_name}"
        system("bundle install")
        system("rspec --init")




end





def execution
if_input_not_entered
name_directory
make_directory_files_install(name_directory)
end

execution
