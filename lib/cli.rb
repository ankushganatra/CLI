require 'thor'
require "cli/version"

require_relative "config/environment"

module Cli

  class Cli < Thor
    desc "new", "Add new rooms"
    def new
      say("Starting with new property #{Property.maximum(:id).to_i+1}.")
      @property = Property.new
      loop_attributes
    end

    desc "list", "Prints available room Title with Id"
    def list
      completed_details = Property.completed
      if completed_details.empty?
        say("No offers found.")
      else
        say("Found #{completed_details.count} offer.")
        Property.completed.each do |property|
          say("#{property.id}: #{property.title}")
        end
      end
    end

    desc "continue [id]", "Continue Editing partial record"
    def continue(id)
      @property = Property.where(id: id.chomp(), completed: false).first
      if @property
        loop_attributes(true)
      else
        say("Invalid Id or Data already filled")
      end
    end

    private

    def loop_attributes(bSkipFilled = false)
      @property.required_attributes(bSkipFilled).each do |attribute, value|
        begin
        set_data!(@property,attribute)
        rescue Interrupt
          @property.send("#{attribute}=", nil)
          break
        end
      end
      @property.save! if @property.valid?
    end

    def set_data!(property, attribute)
      property.send("#{attribute}=", ask("#{attribute.humanize}:"))
      unless property.valid?
        say("#{property.errors.messages.values.join(",").humanize}")
        set_data!(property, attribute)
      end
    end
  end
end