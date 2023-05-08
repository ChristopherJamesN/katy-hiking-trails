# README

A web application built on Rails used to list maintained hiking trails in the Katy, Texas area. Hosted on fly.io here: https://katy-hiking-trails.fly.dev/

## Installation

To test out this application locally, fork and clone the repo.
 `$ git clone your-local-fork-here`

## Usage

Run `bundle install` , `rake db:migrate` , `rake db:seed` , `rails s` , and navigate to the appropriate location in your browser to interact with the application.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ChristopherJamesN/katy-hiking-trails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## Deployment

As noted above, the application is deployed on fly.io. After making changes, to deploy a new
version, run `fly deploy` .

Run `fly open` to open the deployed application in a web browser (or visit
https://katy-hiking-trails.fly.dev/).

Run `fly status` to check on the status of the deployed application, which will provide some
output like:

```shell
App
  Name     = katy-hiking-trails          
  Owner    = personal                    
  Version  = 6                           
  Status   = running                     
  Hostname = katy-hiking-trails.fly.dev  
  Platform = nomad                       

Deployment Status
  ID          = 57cf82f0-dabb-08a3-59bc-ca92c48b7ed4         
  Version     = v6                                           
  Status      = successful                                   
  Description = Deployment completed successfully            
  Instances   = 1 desired, 1 placed, 1 healthy, 0 unhealthy  

Instances
ID      	PROCESS	VERSION	REGION	DESIRED	STATUS 	HEALTH CHECKS     	RESTARTS	CREATED
ea24846b	app    	6      	dfw   	run    	running	1 total, 1 passing	0       	9m56s ago
```

Run `fly dashboard` to open the monitoring dashboard on fly.io for the application, or follow
this url: https://fly.io/apps/katy-hiking-trails.

Run `fly ips list` to list the ip addresses associated with the deployed application.

Run `fly logs` to see the deployed application logs and `fly help` for a full list of available
commands.

## License

The application is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
