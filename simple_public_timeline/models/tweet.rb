class Tweet

    def initialize(user_profile_image, user_profile_link,
                    text, publish_time, source)
        @user_profile_image = user_profile_image
        @user_profile_link = user_profile_link
        @text = text
        @publish_time = publish_time
        @source = source
    end

    # Return the Tweet object's data as comma seperated values string
    def to_s
        data_csv_format = ''
        self.instance_variables.each do |attribute|
            data_csv_format << self.instance_variable_get(attribute) + ','
        end
        return data_csv_format
    end
end