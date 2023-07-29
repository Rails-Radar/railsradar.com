# frozen_string_literal: true

json.array! @interesting_things, partial: 'interesting_things/interesting_thing', as: :interesting_thing
