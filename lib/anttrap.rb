require 'rubygems'
require 'builder'

RAKE='rake'
ANTFILE='build.xml'

task :anttrap do
  
  xml = Builder::XmlMarkup.new( :indent => 2 )
  xml.instruct! :xml, :encoding => "ASCII"  
  proj = xml.project("name" => "Rakefile") do |p|
    Rake::Task.tasks().each do |task|
      p.target("name"=>task) do |t|
        t.exec("executable"=>RAKE) do |e|
          e.arg("value"=>task)
        end
      end
    end
  end
  File.open(ANTFILE,"w+") do |f|
    f.puts proj
  end
end


