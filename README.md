The AntTrap Ruby Gem
====================
A tiny Gem that can generate an Apache Ant build file from a Rakefile. This allows for a developer to
work in Rake, but integrate with any tool that supports Ant. The generated build file simply calls
exec on the Rake file. As of 8/9/2011, the only tool I have tested so far is Eclipse.


Sample rakefile
---
	require 'anttrap'
	
	AntTrap.antproject="RakeFile #{Time.new}"
	AntTrap.rake = '/usr/bin/rake'
	AntTrap.rakeargs = ["-v"]
	
	desc "The Bar task"
	task :Bar do
		puts "Bar!"
	end
	
	desc "The Foo Task"
	task :Foo do 
		puts "Hello world"
	end

Generating an Ant Build File
---
rake AntTrap

Using the Ant Build file in an IDE
---
Whenever you the build.xml file is generated, the Ant file will need to be
refreshed in your IDE. In Eclipse, right click in the Ant view and select "Refresh Buildfiles".


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
operating system. Ideally, a bug report should include a pull request with failing specs.

Copyright
---
Copyright (c) 2011 Dave Parfitt
See [LICENSE](https://github.com/metadave/anttrap/blob/LICENSE) for details.