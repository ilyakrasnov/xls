require 'test_helper'

class TestColumnizer < MiniTest::Unit::TestCase
  def setup
    @columnizer = Xls::Columnizer.new
  end
  
  ######################################
  # Execute
  ######################################
  
  def test_columnize
    input = Spreadsheet.open('fixtures/columnizer/basic.xls')
    output = @columnizer.process(input)
    assert_worksheet [
      ['KEY', 'VALUE'],
      ['col1', 'a'],
      ['col2', 'b'],
      ['col3', 'c'],
      ['col4', 'd'],
      ['col5', 'e'],
      ['col6', 'f'],
      ['col1', 'g'],
      ['col2', 'h'],
      ['col3', 'i'],
      ['col4', 'j'],
      ['col5', 'k'],
      ['col6', 'l']
      ],
      output.worksheet(0)
  end

  def test_columnize_with_fixed_columns
    input = Spreadsheet.open('fixtures/columnizer/fixed_columns.xls')
    @columnizer.fixed_columns = ['fix1', 'fix2']
    output = @columnizer.process(input)
    assert_worksheet [
      ['fix1', 'fix2', 'KEY', 'VALUE'],
      ['AA', 'BB', 'col1', 'a'],
      ['AA', 'BB', 'col2', 'b'],
      ['AA', 'BB', 'col3', 'c'],
      ['AA', 'BB', 'col4', 'd'],
      ['AA', 'BB', 'col5', 'e'],
      ['AA', 'BB', 'col6', 'f'],
      ['CC', 'DD', 'col1', 'g'],
      ['CC', 'DD', 'col2', 'h'],
      ['CC', 'DD', 'col3', 'i'],
      ['CC', 'DD', 'col4', 'j'],
      ['CC', 'DD', 'col5', 'k'],
      ['CC', 'DD', 'col6', 'l']
      ],
      output.worksheet(0)
  end
end
