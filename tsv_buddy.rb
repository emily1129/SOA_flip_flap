# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format

  NEWLINE = "\n"
  TAB = "\t"

  def take_tsv(tsv)
    @data = []
    rows = tsv.split(NEWLINE).map { |line| line.split(TAB)}
    headers = rows.first
    data_rows = rows[1..]
    @data = data_rows.map { |row| headers.zip(row).to_h }
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    headers = @data[0].each_key.map { |key| key }.join(TAB)
    rows = @data.map { |row| NEWLINE + row.values.join(TAB)}
    [headers, rows, NEWLINE].join
  end
end
