# ./lib/exceptions.rb

class ColumnFull < StandardError
  def initialize(msg = 'That column is already full', exception_type = 'custom')
    @exception_type = exception_type
    super(msg)
  end
end
