# frozen_string_literal: true

# Seed Community
BlipActivity.destroy_all
Blip.destroy_all
InterestingThing.destroy_all
TeamUser.destroy_all
Team.destroy_all
User.destroy_all

user = User.create!(
  name: 'Community Seeds',
  email: 'admin@railsradar.com',
  password: '1080897ed2aa4b127a70dca2904d36e11080897ed2aa4b127a70dca2904d36e1'
)

puts "Created Default User: #{user.email}"

community = Team.create(
  name: 'Rails Community',
  is_community: true
)

puts "Created Community: #{community.name}"

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
  puts "Created Tool: #{n}"
end

gems.each do |n|
  InterestingThingCreator.new(name: n, kind: :gem, team: community).call
  puts "Created Gem: #{n}"
end

techniques.each do |n|
  InterestingThingCreator.new(name: n, kind: :technique, team: community).call
  puts "Created Technique: #{n}"
end

platforms.each do |n|
  InterestingThingCreator.new(name: n, kind: :platform, team: community).call
  puts "Created Platform: #{n}"
end

# Seed Blips

InterestingThing.all.each do |thing|
  random_stage = %w[adopt trial assess hold].sample
  results = VoteHandler.new(
    interesting_thing: thing,
    team: community,
    user:,
    stage: random_stage
  ).call

  if results[:success]
    puts results[:data][:blip_activity]
  else
    puts "Error: #{results[:error].message}"
  end
end
