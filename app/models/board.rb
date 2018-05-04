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
      { name: 'Do dishes everyday for a week', level: :easy, description: '' },
      { name: 'Pray through 31 Days of Praise', level: :hard, description: '' },
      { name: 'Memorize Beatitudes', level: :medium, description: 'Beatitudes are in Matthew 5:3-11' },
      { name: 'Read one apologetics book', level: :hard, description: '' },
      { name: 'Share your testimony with one person', level: :easy, description: '' }
    ],
    [
      { name: 'Read one of the Gospels', level: :hard, description: 'Matthew, Mark, Luke and John' },
      { name: 'Read one JD Greear book', level: :medium, description: 'NEED BOOKS' },
      { name: 'Memorize one category of verses', level: :easy, description: 'NEED VERSES' },
      { name: 'Watch all three LOTR movies', level: :medium, description: '' },
      { name: 'Read one CS Lewis book', level: :hard, description: 'NEED LIST' },
    ],
    [
      { name: 'Memorize 3 hymns', level: :medium, description: 'NEED HYMNS' },
      { name: 'Memorize order of the Bible', level: :easy, description: 'Check the Bible' },
      { name: 'Read all of New Testament', level: :xhard, description: '' },
      { name: 'Cook dinner for a friend', level: :easy, description: 'Very awesome!' },
      { name: 'Read one Christian Heroes book', level: :medium, description: 'NEED LIST' },
    ],
    [
      { name: 'Read one "Case For" book', level: :hard, description: 'NEED LIST' },
      { name: 'Read 3 Minor Prophets', level: :medium, description: 'NEED NAMES' },
      { name: 'Watch one Bible Project video series', level: :easy, description: 'NEED LIST' },
      { name: 'Do DT for 2 weeks', level: :medium, description: '' },
      { name: 'Memorize Psalm 1 and 23', level: :hard, description: '' },
    ],
    [
      { name: 'Share DT with your team', level: :easy, description: '' },
      { name: 'Read one Jerry Bridges book', level: :hard, description: 'NEED LIST' },
      { name: 'Read One Major Prophet', level: :medium, description: 'NEED NAMES' },
      { name: 'Read one Christian Classics book', level: :hard, description: 'NEED LIST' },
      { name: 'Memorize one hymn', level: :easy, description: 'NEED HYMNS' }
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
