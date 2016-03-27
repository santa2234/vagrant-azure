# encoding: utf-8
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License in the project root for license information.
require 'log4r'
require 'json'

module VagrantPlugins
  module Azure
    module Action
      class RunInstance
        include Vagrant::Util::Retryable

        def initialize(app, env)
          @app = app
          @logger = Log4r::Logger.new('vagrant_azure::action::run_instance')
        end

        def call(env)
          config = env[:machine].provider_config

          


          env[:machine].id = "#{server.vm_name}@#{server.cloud_service_name}"

          @app.call(env)
        end
      end
    end
  end
end
