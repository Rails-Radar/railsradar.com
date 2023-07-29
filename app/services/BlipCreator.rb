class BlipCreator
    def initialize(team:, interesting_thing:, stage:)
        @team = team
        @interesting_thing = interesting_thing
        @stage = stage
    end

    def call()
        # begin
            blip = Blip.create!(
                interesting_thing: @interesting_thing,
                team: @team,
                stage: @stage,
                radial_noise: generate_radial_noise(),
                angular_noise: generate_angular_noise()
            )
            # {
            #     success: true,
            #     blip: blip
            # }
        # rescue StandardError => e
        #     {
        #         success: false,
        #         errors: e
        #     }
        # end
    end

    private

    def generate_radial_noise()
        rand
    end

    def generate_angular_noise()
        rand - 0.5
    end
end
