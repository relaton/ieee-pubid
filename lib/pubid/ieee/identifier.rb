require 'date'
require "yaml"

UPDATE_CODES = YAML.load_file(File.join(File.dirname(__FILE__), "../../../update_codes.yaml"))

module Pubid::Ieee
  class Identifier
    attr_accessor :number, :publisher, :copublisher, :stage, :part, :subpart, :status, :approval,
                  :edition, :draft, :rev, :corr, :amd, :redline, :year, :month, :type, :alternative,
                  :draft_status

    def initialize(organizations:, type_status:, number:, parameters:)
      @number = number
      [organizations, type_status, parameters].each do |data|
        case data
        when Hash
          set_values(data.transform_values { |v| (v.is_a?(Array) && merge_parameters(v)) || v })
        when Array
          set_values(merge_parameters(data))
        end
      end
    end

    def set_values(hash)
      hash.each { |key, value| send("#{key}=", value.is_a?(Enumerable) && value || value.to_s) }
    end

    def self.update_old_code(code)
      UPDATE_CODES.each do |from, to|
        code = code.gsub(from.match?(/^\/.*\/$/) ? Regexp.new(from[1..-2]) : from, to)
      end
      code
    end

    def merge_parameters(params)
      return params unless params.is_a?(Array)

      result = {}
      params.each do |item|
        item.each do |key, value|
          if result.key?(key)
            result[key] = result[key].is_a?(Array) ? result[key] << value : [result[key], value]
          else
            result[key] = value
          end
        end
      end
      result
    end

    def self.parse(code)
      new(**Transformer.new.apply(Parser.new.parse(update_old_code(code))).to_h)

    rescue Parslet::ParseFailed => failure
      raise Pubid::Ieee::Errors::ParseError, "#{failure.message}\ncause: #{failure.parse_failure_cause.ascii_tree}"
    end

    def to_s
      "#{publisher}#{copublisher} #{draft_status}#{type}#{number}#{part}#{subpart}#{year}#{draft}#{edition}#{alternative}"
    end

    def copublisher
      return "" unless @copublisher

      if @copublisher.is_a?(Array)
        @copublisher&.map { |c| "/#{c}" }&.join
      else
        "/#{@copublisher}"
      end
    end

    def part
      ".#{@part}" if @part
    end

    def subpart
      @subpart if @subpart && !@subpart.empty?
    end

    def type
      "#{@type} " if @type
    end

    def year
      "-#{@year}" if @year
    end

    def alternative
      if @alternative
        if @alternative.is_a?(Array)
          " (#{@alternative.map { |a| Identifier.new(**a) }.join(', ')})"
        else
          " (#{Identifier.new(**@alternative)})"
        end
      end
    end

    def edition
      return "" unless @edition

      result = " Edition "
      if @edition[:version]
        result += @edition[:version] == "First" ? "1.0 " : "#{@edition[:version]} "
      end

      result += "#{@edition[:year]}" if @edition[:year]
      if @edition[:month]
        month = @edition[:month]
        month = Date.parse(@edition[:month]).month if month.to_i.zero?
        result += "-#{sprintf('%02d', month)}"
      end
      result += "-#{@edition[:day]}" if @edition[:day]
      result
    end

    def draft
      return "" unless @draft

      result = "/D#{@draft[:version].is_a?(Array) ? @draft[:version].join('D') : @draft[:version]}"
      result += ".#{@draft[:revision]}" if @draft[:revision]
      result += ", #{@draft[:month]}" if @draft[:month]
      result += " #{@draft[:day]}," if @draft[:day]
      result += " #{@draft[:year]}" if @draft[:year]
      result
    end

    def draft_status
      "#{@draft_status} Draft " if @draft_status
    end
  end
end
