# frozen_string_literal: true

# Seed Community
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
  InterestingThing.create(name: n, kind: InterestingThing.kind[:tool], team: community)
end

gems.each do |n|
  InterestingThing.create(name: n, kind: InterestingThing.kind[:gem], team: community)
end

techniques.each do |n|
  InterestingThing.create(name: n, kind: InterestingThing.kind[:technique], team: community)
end

platforms.each do |n|
  InterestingThing.create(name: n, kind: InterestingThing.kind[:platform], team: community)
end
