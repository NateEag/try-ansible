I care a good bit about automating infrastructure.

I would also like to make my hosting provider ephemeral.

I started working towards that goal with Puppet, but after attending a talk at
CPOSC 2014, I decided to look into Ansible.

I liked what I saw at first. I can see how Puppet is probably better for many
cases, but for what I want to do, Ansible might be best, and it seems like it
might fit my personal style well.

So, I'd like to try setting up some basic server provisioning via Ansible on a
Vagrant box and see how it goes.

...okay, I have a simple script to install Ansible in a local virtualenv.

Next is to start a Vagrantfile. Looks like by default Vagrant assumes all hosts
in an Ansible-based Vagrantfile are managed? It says you don't need to tell it
which one to work on unless you want to.

guess I should see if I can get avahi installed and publishing the box's hostname.

Found a module or two on GitHub that might do the job. First, read the docs...

summarizing a few bits of terminology:

*Inventory* is where you categorize hosts by role/group - these are the DB
 servers, these are the webservers... a single host can be in more than one
 group. You can set variables per group, or burrow down to individual host
 level.

 Inventory is done with static files by default, but there are plenty of
 plugins to let you manage it in other ways.

*Patterns* are used to specify what machines will have a given process run on
 them. The simplest pattern is a group name from the inventory.

*Ad-hoc tasks* let you cheat en masse. Sometimes you really just want to get
 something done fast on a lot of machines. I'd see this as most useful when
 something's gone horribly wrong (logs filled up drive space, memory's all been
 leaked) and you need a quick, safeish hack to get things unwedged across a
 bunch of machines. The "automate everything" principle means you should use
 playbooks for everything that's not a panic situation.

*Modules* implement a related set of idempotent actions for a specific purpose,
 often for managing a particular software package (but in principle it could be
 anything - ships with modules for managing things like users/groups).

*Playbooks* use modules to define a list of actions that should happen.
