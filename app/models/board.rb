class Board < ApplicationRecord
  CELL_SCORE = {
    easy: 5,
    medium: 10,
    hard: 15,
    xhard: 20,
  }

  ROW_SCORE = 25

  LAYOUT = [
    [
      { name: 'blah', level: :easy, description: 'hey' },
      { name: 'ha', level: :hard, description: 'hey' },
      { name: 'blah', level: :medium, description: 'hey' },
      { name: 'ha', level: :hard, description: 'hey' },
      { name: 'ka', level: :easy, description: 'hey' }
    ],
    [
      { name: 'ha', level: :hard, description: 'hey' },
      { name: 'blah', level: :medium, description: 'hey' },
      { name: 'blah', level: :easy, description: 'hey' },
      { name: 'blah', level: :medium, description: 'hey' },
      { name: 'ha', level: :hard, description: 'hey' },
    ],
    [
      { name: 'blah', level: :medium, description: 'hey' },
      { name: 'blah', level: :easy, description: 'hey' },
      { name: 'ha', level: :xhard, description: 'REALLY HARD' },
      { name: 'blah', level: :easy, description: 'hey' },
      { name: 'blah', level: :medium, description: 'hey' },
    ],
    [
      { name: 'ha', level: :hard, description: 'hey' },
      { name: 'blah', level: :medium, description: 'hey' },
      { name: 'blah', level: :easy, description: 'hey' },
      { name: 'blah', level: :medium, description: 'hey' },
      { name: 'ha', level: :hard, description: 'hey' },
    ],
    [
      { name: 'blah', level: :easy, description: 'hey' },
      { name: 'ha', level: :hard, description: 'hey' },
      { name: 'blah', level: :medium, description: 'hey' },
      { name: 'ha', level: :hard, description: 'hey' },
      { name: 'ka', level: :easy, description: 'hey' }
    ],
  ]

  has_many :cells
  belongs_to :user

  def score
    # cells_total
    cells_total = cells.inject(0){ |sum, cell|
      sum + CELL_SCORE[LAYOUT[cell.row][cell.col][:level]]
    }
    # rows_total
    rows_total = cells.group_by(&:row).inject(0){ |sum, (row_index, rows)|
      rows.count == 5 ? sum + ROW_SCORE : 0
    }

    # cols_total
    cols_total = cells.group_by(&:col).inject(0){ |sum, (row_index, rows)|
      rows.count == 5 ? sum + ROW_SCORE : 0
    }

    # diags_total
    cells_rc = cells.pluck(:row, :col)
    diags_total = 0
    diags_total += ROW_SCORE if (cells_rc & [[0, 0], [1, 1], [2, 2], [3, 3], [4, 4]]).count == 5
    diags_total += ROW_SCORE if (cells_rc & [[0, 4], [1, 3], [2, 2], [3, 1], [4, 0]]).count == 5

    # total
    cells_total + rows_total + cols_total + diags_total
  end

end
