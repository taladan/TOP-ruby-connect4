# lib/cf_helpers.rb

module CfHelper
  attr_reader :winner, :starting_index

  def game_over?(matrix = @board_matrix)
    check_rows(matrix) || check_columns(matrix) || check_diagonals(matrix)
  end

  private

  def check_rows(matrix = @board_matrix)
    @winner = nil
    @starting_index = nil
    # iterate through rows
    matrix.row_count.times do |count|
      row = matrix.row(count)
      # if there is a set of dupes found set `winner` & `starting_index` variables
      @winner, @starting_index = find_consecutive_duplicates(row) unless find_consecutive_duplicates(row) == [nil, nil]
    end
    # return true if winner set, false if not
    @winner ? true : false
  end

  def check_columns(matrix = @board_matrix)
    @winner = nil
    @starting_index = nil
    # iterate through columns
    matrix.column_count.times do |count|
      col = matrix.column(count)
      # if there is a set of dupes found set `winner` & `starting_index` variables
      @winner, @starting_index = find_consecutive_duplicates(col) unless find_consecutive_duplicates(col) == [nil, nil]
    end
    # return true if winner set, false if not
    @winner ? true : false
  end

  def check_diagonals(matrix = @board_matrix)
    diagonals = calculate_diagonals(matrix)

    # Check ascending diagonals
    diagonals[:ascending_diagonals].each do |diagonal|
      # if there is a set of dupes found set `winner` & `starting_index` variables
      @winner, @starting_index = find_consecutive_duplicates(diagonal) unless find_consecutive_duplicates(diagonal) == [
        nil, nil
      ]
    end

    # check descending diagonals
    diagonals[:descending_diagonals].each do |diagonal|
      # if there is a set of dupes found set `winner` & `starting_index` variables
      @winner, @starting_index = find_consecutive_duplicates(diagonal) unless find_consecutive_duplicates(diagonal) == [
        nil, nil
      ]
    end
    @winner ? true : false
  end

  def calculate_diagonals(matrix = @board_matrix)
    output = {
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
    fp.each { |i| output[:ascending_diagonals] << i if i.length >= 4 }
    rp.each { |i| output[:descending_diagonals] << i if i.length >= 4 }

    output
  end

  # find `len` consecutive elements in any array or vector passed
  def find_consecutive_duplicates(vector, len = 4)
    count = 1
    current_element = nil
    starting_index = nil

    vector.each_with_index do |element, index|
      if element != '◯' && element == current_element
        count += 1
      else
        count = 1
        current_element = element
        starting_index = index
      end

      return [current_element, starting_index] if count == len
    end

    nil
  end
end
