The AntTrap Ruby Gem
====================
A tiny Gem that can generate an Apache Ant build file from a Rakefile. This allows for a developer to
work in Rake, but integrate with any tool that supports Ant. The generated build file simply calls
exec on the selected Rake task. 

Use It In Your Favorite IDE
---
	Tested on:
	IntelliJ Idea 10.5.1
	NetBeans 7.0
	Eclipse Indigo


Sample rakefile
---
	require 'anttrap'
	
	AntTrap.antproject="RakeFile #{Time.new}"
	AntTrap.rake = '/usr/bin/rake'
	AntTrap.rakeargs = ["-v"]
	AntTrap.antfile="build.xml"
	
	desc "The Bar task"
	task :Bar do
		puts "Bar!"
	end
	
	desc "The Foo Task"
	task :Foo do 
		puts "Hello world"
	end


Sample Generated Ant Build File
---
	<!-- this file is generated automatically -->
	<?xml version="1.0" encoding="ASCII"?>
	<project name="RakeFile Tue Aug 09 13:35:22 -0400 2011">
	<target name="AntTrap" description="Generate an ant build file from this Rake file">
		<exec executable="/usr/bin/rake">
			<arg value="-v"/>
			<arg value="AntTrap"/>
		</exec>
	</target>
	
	<target name="Clean" description="Clean">
		<exec executable="/usr/bin/rake">
			<arg value="-v"/>
			<arg value="Clean"/>
		</exec>
	</target>
	<target name="Compile" description="Compile Java">
		<exec executable="/usr/bin/rake">
			<arg value="-v"/>
			<arg value="Compile"/>
		</exec>
	</target>
	</project>



Generating an Ant Build File
---
rake AntTrap


Using the Ant Build file in an IDE
---
Simply use the Ant build file in your favorite IDE like you always have. Each time you modify the rakefile, be sure to run "rake AntTrap" (or just run the AntTrap task from your IDE). 

Whenever you the build.xml file is generated, the Ant file will need to be
refreshed in your IDE. In Eclipse, right click in the Ant view and select "Refresh Buildfiles".


Compiling Multiple Java Files from Rake
---
see the [sample rakefile](https://github.com/metadave/anttrap/blob/master/samples/rakefile)



Installation
---
Unix:
sudo gem install anttrap

Windows:
gem install anttrap

Submitting an Issue
---
I use the [GitHub issue tracker](http://github.com/metadave/anttrap/issues) to track bugs and
features. Before submitting a bug report or feature request, check to make sure it hasn't already
been submitted. You can indicate support for an existing issuse by voting it up. When submitting a
bug report, please include a [Gist](http://gist.github.com/) that includes a stack trace and any
details that may be necessary to reproduce the bug, including your gem version, Ruby version, and
operating system. 

Feedback
---
If you find this Gem useful, please send feedback to diparfitt at gmail dot com.

Copyright
---
Copyright (c) 2011 Dave Parfitt

