class Board < ApplicationRecord
  has_many :cells
  belongs_to :user

  SCORE = { easy: 10, medium: 20, hard: 50, xhard: 100, bingo: 200 }

  CELLS = [
    [
      { name: 'Do dishes everyday for a week', level: :easy, description: 'Your roommates will love you!' },
      { name: 'Pray through 31 Days of Praise', level: :hard, description: 'Learn how to connect with God through reading well-written prayers of praise.' },
      { name: 'Memorize the Beatitudes', level: :medium, description: 'The Beatitudes is in Matthew 5:3-11' },
      { name: 'Read one apologetics book', level: :hard, description: 'More Than a Carpenter, Letters from a Skeptic, or another apologetics book of your choice.' },
      { name: 'Share your testimony', level: :easy, description: 'Share your testimony of how you came to believe in Jesus with at least one person this summer.' }
    ],
    [
      { name: 'Read one of the four Gospels', level: :hard, description: 'They are Matthew, Mark, Luke and John. Feel free to read them all.' },
      { name: 'Read one JD Greear book', level: :medium, description: 'A couple of suggested titles are <em>The Gospel</em> and <em>Stop Asking Jesus Into Your Heart</em>.' },
      { name: 'Memorize one category of verses', level: :easy, description: 'Click <a href="http://www.fountainoflifebaptist.com/100verses.html" target="_blank">here</a> to see the categories of verses.' },
      { name: 'Watch all three LOTR movies', level: :medium, description: "Tolkien's epic story illustrates many deep spiritual truths and lessons." },
      { name: 'Read one CS Lewis book', level: :hard, description: 'Some titles include <em>Mere Christianity</em>, <em>Weight of Glory</em>, <em>Screwtape Letter</em>, <em>Great Divorce</em>, <em>Problem of Pain</em>, <em>Surprised by Joy</em>' },
    ],
    [
      { name: 'Memorize three hymns', level: :medium, description: 'Hymns are soul anchoring songs. Here are a few good ones: Amazing Grace, When I Survey The Wondrous Cross, What a Friend We Have in Jesus.' },
      { name: 'Memorize the order of the Bible', level: :easy, description: 'This will help you quickly find Bible references.' },
      { name: 'Read the entire New Testament', level: :xhard, description: 'A long read but definitely a GREAT read!' },
      { name: 'Cook dinner for a friend', level: :easy, description: 'Very nice!' },
      { name: 'Read one Christian Heroes book', level: :medium, description: 'CT Studd, Gladys Aylward, Hudson Taylor, Adoniram Judson, Amy Carmichael, Corrie Ten Boom. Let them help us calibrate our devotion to God.' },
    ],
    [
      { name: 'Read one "Case For" book', level: :hard, description: 'Case for Christ, Case for Faith, Case for Grace, Case for Creator' },
      { name: 'Read three Minor Prophets', level: :medium, description: 'Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi' },
      { name: 'Watch one Bible Project video series', level: :easy, description: 'Join the Bible Project video has varying length of video series. You can find them <a href="https://thebibleproject.com/all-videos/" target="_blank">here</a>.' },
      { name: 'Do DT for two weeks', level: :medium, description: 'Encouragement to practice regular spiritual discipine that can easily slip up during the summer.' },
      { name: 'Memorize Psalm 1 and Psalm 23', level: :hard, description: 'These are two great psalms to memorize.' },
    ],
    [
      { name: 'Share DT with your team', level: :easy, description: 'Please share over email or better yet video conference with your team how God has spoken to you.' },
      { name: 'Read one Jerry Bridges book', level: :hard, description: '<em>Pursuit of holiness</em>, <em>Practice of Godliness</em>, <em>Discipline of Grace</em> will motivate you to pursue God.' },
      { name: 'Read One Major Prophet', level: :medium, description: 'Isaiah, Jeremiah, Ezekiel, Daniel' },
      { name: 'Read one Christian Classics book', level: :hard, description: 'Must-read classics: <em>Humility</em> by Andrew Murray, <em>The Calvary Road</em> by Roy Hession, <em>We Would See Jesus</em> by Roy Hession, <em>Loving God</em> by Charles (Chuck) Colson' },
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
