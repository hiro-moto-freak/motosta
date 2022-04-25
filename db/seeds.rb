require "csv"

CSV.foreach('db/csv/motorcycle.csv', headers: true) do |row|
  Motorcycle.create(
    manufacturer: row['manufacturer'].to_i,
    displacement: row['displacement'].to_i,
    name: row['name'],
  )
end
