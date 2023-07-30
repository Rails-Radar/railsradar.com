class VoteHandler
    def initialize(interesting_thing:, team:, user:, stage:, comments: nil, 
                  blip_stage_changer: BlipStageChanger, blip_creator: BlipCreator,
                  transaction: Blip.transaction
                )

        if [interesting_thing, team, stage].any?(&:nil?)
            raise ArgumentError.new("interesting_thing, team, and stage are required")
        end

        @team = team
        @user = user
        @interesting_thing = interesting_thing
        @blip_stage_changer = blip_stage_changer
        @blip_creator = blip_creator
        @stage = stage
        @comments = comments
    end

    def call()
        begin
            transaction do
                existing_blip = get_last_blip(team: @team, interesting_thing: @interesting_thing)
                if existing_blip
                    results = @blip_stage_changer.new(
                        blip: existing_blip, 
                        user: @user, 
                        stage: @stage
                    ).call
                    raise results[:error] unless results[:success]
                else
                    results = @blip_creator = @blip_creator.new(
                        team: @team, 
                        interesting_thing: @interesting_thing, 
                        stage: @stage
                    ).call
                    raise results[:error] unless results[:success]
                end
            end
            {
                success: true,
                data: ba
            }
        rescue StandardError => e
            {
                success: false,
                errors: e
            }
        end
    end

end