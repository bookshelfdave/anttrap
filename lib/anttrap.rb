# Copyright (c) 2011 Dave Parfitt
#
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
# documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
# the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, 
# and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

#The above copyright notice and this permission notice shall be included in all copies or substantial portions 
# of the Software.

#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
# PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE 
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE 
# USE OR OTHER DEALINGS IN THE SOFTWARE.

require 'rubygems'
require 'builder'

module AntTrap
  @@rake = "rake"
  @@antfile = "build.xml"
  @@antproject = "Rakeproject"
  def self.rake
    @@rake
  end
  def self.rake=(v)
    @@rake = v
  end

  def self.antfile
    @@antfile
  end
  def self.antfile=(v)
    @@antfile = v
  end

  def self.antproject
    @@antproject
  end
  def self.antproject=(v)
    @@antproject=v
  end
end


task :anttrap do
  
  xml = Builder::XmlMarkup.new( :indent => 2 )
  xml.instruct! :xml, :encoding => "ASCII"  
  proj = xml.project("name" => AntTrap.antproject) do |p|
    Rake::Task.tasks().each do |task|
      p.target("name"=>task) do |t|
        t.exec("executable"=>AntTrap.rake) do |e|
          e.arg("value"=>task)
        end
      end
    end
  end
  File.open(AntTrap.antfile,"w+") do |f|
    f.puts proj
  end
end


