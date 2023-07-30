# frozen_string_literal: true

# Seed Community
user = User.create!(
  email: 'admin@railsradar.com',
)

community = Team.create(name: 'Rails Community',
                        is_community: true)

tools = [
  'Github Copilot',
  'Faker',
  'Brakeman',
  'SimpleCov',
  'Rubocop',
  'Bundler',
  'Pry',
  'Rake',
  'Make',
  'Reek',
  'Drawnscanner',
  'Webpack',
  'Ruby Vite'
]

gems = [
  'Devise',
  'Pundit',
  'Kaminari',
  'RailsAdmin',
  'Webpacker',
  'Bullet',
  'Slim',
  'Figaro',
  'Rack-Attack',
  'Delayed Job',
  'Paperclip',
  'Cancancan',
  'Geocoder',
  'Ransack'
]

techniques = [
  'HTML Over the Wire',
  'Service Objects',
  'Form Objects',
  'Presenters',
  'Service Components',
  'Interactors',
  'Query Objects',
  'Decorators',
  'Policy Objects',
  'Value Objects',
  'View Objects',
  'Event Sourcing',
  'Event Sourced',
  'CRUD',
  'Event Driven',
  'Domain Driven Design',
  'Hexagonal Architecture',
  'Observer Pattern',
  'Command Query Responsibility Segregation',
  'Code Generators',
  'Utility CSS',
  'Active Record Callbacks'
]

platforms = [
  'Heroku',
  'AWS App Runner',
  'AWS Lambda',
  'AWS ECS',
  'AWS Fargate',
  'AWS Elastic Beanstalk',
  'Kubernetes',
  'Digital Ocean',
  'Google Cloud',
  'Azure',
  'Netlify',
  'Vercel',
  'Render',
  'Fly.io',
  'Linode',
  'Rackspace',
  'Cloudflare',
  'Fastly',
  'Akamai',
  'Cloudinary'
]

tools.each do |n|
  InterestingThingCreator.new(name: n, kind: :tool, team: community).call
end

gems.each do |n|
  InterestingThingCreator.new(name: n, kind: :gem, team: community).call
end

techniques.each do |n|
  InterestingThingCreator.new(name: n, kind: :technique, team: community).call
end

platforms.each do |n|
  InterestingThingCreator.new(name: n, kind: :infrastructure, team: community).call
end


# Seed Blips

InterestingThing.all.each do |thing|
  random_stage = %w[adopt trial assess hold].sample
  VoteHandler.new(
    interesting_thing: thing, 
    team: community,
    user: user,
    stage: random_stage).call
end