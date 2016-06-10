# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "kconv"
require "csv"

seeds = Dir.glob("#{Rails.root}/db/seeds/*")

seeds.each do |path|
  model = File.basename(path, '.csv').gsub(/master_/, '').classify.constantize
  puts path
  csv = CSV.open(path, 'r:bom|utf-8')
  columns = csv.shift
  id_index = columns.index('id')
  csv.each do |line|
    next unless line.any?
    if id_index && line[id_index] != ""
      record = model.exists?(line[id_index]) ? model.find(line[id_index]) : model.new
    else
      record = model.new
    end
    (columns - %w|id|).each do |name|
      i = columns.index(name)
      next unless i
      value = line[i]
      value = value.to_s.toutf8 unless value.nil?
      record.send("#{name}=", value) if value
    end
    record.id = line[columns.index('id')] if columns.include? 'id'
    record.save
  end
end
