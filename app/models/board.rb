class Board < ApplicationRecord
  has_many :cells
  belongs_to :user

  SCORE = { easy: 10, medium: 20, hard: 50, xhard: 100, bingo: 200 }

  CELLS = [
    [
      { name: 'Do dishes everyday for a week', level: :easy, description: '' },
      { name: 'Pray through 31 Days of Praise', level: :hard, description: '' },
      { name: 'Memorize the Beatitudes', level: :medium, description: 'The Beatitudes is in Matthew 5:3-11' },
      { name: 'Read one apologetics book', level: :hard, description: 'More Than a Carpenter, Letters from a Skeptic' },
      { name: 'Share your testimony with one person', level: :easy, description: '' }
    ],
    [
      { name: 'Read one of the Gospels', level: :hard, description: 'Matthew, Mark, Luke and John' },
      { name: 'Read one JD Greear book', level: :medium, description: 'The Gospel, Stop Asking Jesus Into Your Heart' },
      { name: 'Memorize one category of verses', level: :easy, description: 'Click <a href="http://www.fountainoflifebaptist.com/100verses.html">here</a> to see the categories of verses.' },
      { name: 'Watch all three LOTR movies', level: :medium, description: '' },
      { name: 'Read one CS Lewis book', level: :hard, description: 'Mere Christianity, Weight of Glory, Screwtape Letter, Great Divorce, Problem of Pain, Surprised by Joy' },
    ],
    [
      { name: 'Memorize 3 hymns', level: :medium, description: 'Amazing Grace, When I Survey The Wondrous Cross, What a Friend We Have in Jesus' },
      { name: 'Memorize order of the Bible', level: :easy, description: '' },
      { name: 'Read all of New Testament', level: :xhard, description: '' },
      { name: 'Cook dinner for a friend', level: :easy, description: 'Very nice!' },
      { name: 'Read one Christian Heroes book', level: :medium, description: 'CT Studd, Gladys Aylward, Hudson Taylor, Adoniram Judson, Amy Carmichael, Corrie Ten Boom' },
    ],
    [
      { name: 'Read one "Case For" book', level: :hard, description: 'Case for Christ, Case for Faith, Case for Grace, Case for Creator' },
      { name: 'Read 3 Minor Prophets', level: :medium, description: 'Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi' },
      { name: 'Watch one Bible Project video series', level: :easy, description: '' },
      { name: 'Do DT for 2 weeks', level: :medium, description: '' },
      { name: 'Memorize Psalm 1 and 23', level: :hard, description: '' },
    ],
    [
      { name: 'Share DT with your team', level: :easy, description: '' },
      { name: 'Read one Jerry Bridges book', level: :hard, description: 'Pursuit of holiness, Practice of Godliness, Discipline of Grace' },
      { name: 'Read One Major Prophet', level: :medium, description: 'Isaiah, Jeremiah, Ezekiel, Daniel' },
      { name: 'Read one Christian Classics book', level: :hard, description: 'Humility, Calvary Road, We Would See Jesus, Loving God' },
      { name: 'Memorize one hymn', level: :easy, description: 'Amazing Grace, When I Survey The Wondrous Cross, What a Friend We Have in Jesus' }
    ],
  ]

  def score
    # cells_total
    cells_total = cells.inject(0){ |sum, cell|
      sum + SCORE[CELLS[cell.row][cell.col][:level]]
    }
    # rows_total
    rows_total = cells.group_by(&:row).inject(0){ |sum, (row_index, rows)|
      sum + (rows.count / 5 * SCORE[:bingo])
    }

    # cols_total
    cols_total = cells.group_by(&:col).inject(0){ |sum, (row_index, rows)|
      sum + (rows.count / 5 * SCORE[:bingo])
    }

    # diags_total
    cells_rc = cells.pluck(:row, :col)
    diags_total = (cells_rc & [[0, 0], [1, 1], [2, 2], [3, 3], [4, 4]]).count / 5 * SCORE[:bingo]
    diags_total += (cells_rc & [[0, 4], [1, 3], [2, 2], [3, 1], [4, 0]]).count / 5 * SCORE[:bingo]

    # total
    cells_total + rows_total + cols_total + diags_total
  end
end
