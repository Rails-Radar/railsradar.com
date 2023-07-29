default: help

all: install update setup clean test-all # Run all commands for setup

install: # Install dependencies
	bundle install
	
dev: # Run development server
	bin/dev

update: # Update dependencies
	bundle update

# Ruby on Rails

setup: # Setup the project
	bundle install --redownload
	gem install htmlbeautifier solargraph
	bin/rails db:setup

reset: clean # Reset the project
	bin/rails db:reset	

## Testing and Linting

lint: # Run rubocop
	rubocop -A

test-all: # Run all tests
	bin/rails test:all

t: test-all # Shortcut to run all tests

## Development

stub: # Generate binstubs with gem=gem_name
	bundle binstubs $(gem) --force

clean: # Clean assets
	bin/rails assets:clean
	rm -rf tmp/cache
	rm -rf public/assets

## Credentials

c: # Edit credentials
	EDITOR="code --wait" rails credentials:edit

c-prod: # Edit credentials for production
	EDITOR="code --wait" rails credentials:edit --environment production

help: # Print this help message
	@echo "Usage: \n"
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done