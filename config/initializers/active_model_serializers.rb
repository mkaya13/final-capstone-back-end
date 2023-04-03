# frozen_string_literal: true

ActiveModel::Serializer.config.adapter = :json_api
ActiveModelSerializers.config.key_transform = :underscore
