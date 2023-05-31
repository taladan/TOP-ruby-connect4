# lib/cf_helpers.rb

module CfHelper
  def game_over?(matrix)
    check_rows(matrix)
    check_columns(matrix)
    check_diagonals(matrix)
  end

  private

  def calculate_diagonals(matrix)
    @diagonals = {
      ascending_diagonals: [],
      descending_diagonals: []
    }

    # Convert to array
    arr = matrix.to_a

    # We will pad both sides of the array to get the diagonals
    # to line up in the same index positions.
    padding = [*0..(arr.length - 1)].map { |i| [nil] * i }

    # Apply padding to both sides of the array
    # Forward_padded aligns the ascending diagonals
    # Reverse_padded aligns the descending diagonals
    forward_padded = padding.reverse.zip(arr).zip(padding).map(&:flatten)
    reverse_padded = padding.zip(arr).reverse.zip(padding).map(&:flatten)

    # Transpose and compact each to get just the diagonals
    fp = forward_padded.transpose.map(&:compact)
    rp = reverse_padded.transpose.map(&:compact)

    # We only want diagonals that are at least 4 long
    fp.each { |i| @diagonals[:ascending_diagonals] << i if i.length >= 4 }
    rp.each { |i| @diagonals[:descending_diagonals] << i if i.length >= 4 }

    @diagonals
  end

  def check_rows
    # code here
  end

  def check_columns
    # code here
  end

  def check_diagonals
    # code here
  end
end
